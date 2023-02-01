import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'details/CongressMenu.dart';
import 'model/congress_model.dart';
import 'package:http/http.dart' as http;

class CongressScreen extends StatefulWidget {
  const CongressScreen({Key? key}) : super(key: key);

  @override
  _CongressScreenState createState() => _CongressScreenState();
}

class _CongressScreenState extends State<CongressScreen> {
  List<CongressClass> litems = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }
  _loadData() async {
   // var url = "http://192.168.8.100/emecexpo/loadcongress.php";
    //var res = await http.post(Uri.parse(url));
    //List<CongressClass> Congress = (json.decode(res.body) as List)
      //  .map((data) => CongressClass.fromJson(data))
        //.toList();
   // litems=Congress;
    var con1=CongressClass(1, "CEO & leadership Summit");
    litems.add(con1);
    var con2=CongressClass(2, "CIO Summit");
    litems.add(con2);
    var con3=CongressClass(3, "HR Summit");
    litems.add(con3);
    var con4=CongressClass(4, "CDO Summit & Big Data Eries");
    litems.add(con4);
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
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
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: isLoading == true
              ? Center(
              child: SpinKitThreeBounce(
                color: Color(0xff00c1c1),
                size: 30.0,
              ))
              :  FadeInDown(
            duration: Duration(milliseconds: 500),
                child: Container(
            color: Colors.white,
            child: new ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (_, int position) {
                    return new Card(
                      color: Colors.white,
                      shape: BorderDirectional(
                        bottom:BorderSide(color: Colors.black12, width: 1),
                      ),
                      child: new ListTile(
                        leading: new ClipOval(
                          child: Icon(
                              Icons.web,
                            color: Colors.black,
                          )
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CongressDScreen()));
                        },
                      ),
                    );
                  }),
          ),
              ),
        ));
  }
}
