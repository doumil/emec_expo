import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/model/congress_model_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'database_helper/database_helper.dart';
import 'details/DetailCongress.dart';
import 'model/exhibitors_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAgendaScreen extends StatefulWidget {
  const MyAgendaScreen({Key? key}) : super(key: key);

  @override
  _MyAgendaScreenState createState() => _MyAgendaScreenState();
}

class _MyAgendaScreenState extends State<MyAgendaScreen> {
  List<CongressDClass> litems = [];
  var db = new DataBaseHelperNotif();
  bool isLoading = true;

  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }

  _click() {

  }

  _loadData() async {
      var data =await db.getListAgenda();
      print(data);
      litems = data;
      //litems=litems.reversed.toList();
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    /*
    var url = "http://192.168.8.100/emecexpo/loadexhibitors.php";
    var res = await http.post(Uri.parse(url));
    List<ExhibitorsClass> exh = (json.decode(res.body) as List)
        .map((data) => ExhibitorsClass.fromJson(data))
        .toList();
    */
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text('Êtes-vous sûr'),
        content: new Text('Voulez-vous quitter une application'),
        actions: <Widget>[
          new TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Non'),
          ),
          new TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: new Text('Oui '),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: isLoading == true
          ? Container(
        margin: EdgeInsets.only(
            top: height * 0.02),
        padding: EdgeInsets.only(
            left:  height * 0.02,
            bottom: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text("There is not data in youre Agenda\nPush the icon  :",style: TextStyle(color: Colors.black87,fontSize: 16),),
          Icon(Icons.add_box
              ,size: 40,
            color: Colors.black45,
          ),
          Text("from exhibitor or conferences sheet to add them to\n youre Agenda",style: TextStyle(color: Colors.grey,fontSize: 14),),
        ]),

      )
          : FadeInDown(
        duration: Duration(milliseconds: 500),
            child: Container(
        color: Colors.white,
        child: new ListView.builder(
              itemCount: litems.length,
              itemBuilder: (_, int position) {
                return new Card(
                  color: Colors.white,
                  shape: BorderDirectional(
                    bottom: BorderSide(color: Colors.black12, width: 1),
                  ),
                  child: new ListTile(
                    leading: Container(
                      padding: EdgeInsets.fromLTRB(4, 4,4,4),
                      decoration: BoxDecoration(
                        color: Color(0xff261350),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(5.0),
                          right: Radius.circular(5.0),
                        ),
                      ),
                      width:60.0,
                      child: Text("${litems[position].datetimeStart}\n${litems[position].datetimeEnd}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "${litems[position].title}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle:Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "${litems[position].discription}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailCongressScreen(check: false,)));
                    },
                  ),
                );
              }),
      ),
          ),
    );
  }
}
