import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'model/congress_model.dart';
import 'model/activities_model.dart';
import 'package:http/http.dart' as http;

class ActivitesScreen extends StatefulWidget {
  const ActivitesScreen({Key? key}) : super(key: key);

  @override
  _ActivitesScreenState createState() => _ActivitesScreenState();
}

class _ActivitesScreenState extends State<ActivitesScreen> {
  List<ActivitiesClass> litems = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }
  _loadData() async {
   // var url = "http://192.168.8.100/emecexpo/loadactivities.php";
    //var res = await http.post(Uri.parse(url));
    //List<ActivitiesClass> act = (json.decode(res.body) as List)
      //  .map((data) => ActivitiesClass.fromJson(data))
        //.toList();
    //litems=act;
    var act1=ActivitiesClass("DOCUWARE", "ipad's tombola ", "During the 3days show , we will be raffing "
        "and ipad 10 ... "
        "just have to visit us at booth C308"
        "and guess how mush wasted paper is inside the box."
        "\n\n Dont miss it !", "tue, 14 jun 09:00");
    litems.add(act1);
    var act2=ActivitiesClass("DOCUWARE", "ipad's tombola ", "During the 3days show , we will be raffing "
        "and ipad 10 ... "
        "just have to visit us at booth C308"
        "and guess how mush wasted paper is inside the box."
        "\n\n Dont miss it !", "tue, 14 jun 09:00");
    litems.add(act2);
    var act3=ActivitiesClass("DOCUWARE", "ipad's tombola ", "During the 3days show , we will be raffing "
        "and ipad 10 ... "
        "just have to visit us at booth C308"
        "and guess how mush wasted paper is inside the box."
        "\n\n Dont miss it !", "tue, 14 jun 09:00");
    litems.add(act3);
    var act4=ActivitiesClass("DOCUWARE", "ipad's tombola ", "During the 3days show , we will be raffing "
        "and ipad 10 ... "
        "just have to visit us at booth C308"
        "and guess how mush wasted paper is inside the box."
        "\n\n Dont miss it !", "tue, 14 jun 09:00");
    litems.add(act4);
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              : new ListView.builder(
              itemCount: litems.length,
              itemBuilder: (_, int position) {
                return new Card(
                  color: Colors.white,
                  shape: BorderDirectional(
                    bottom:BorderSide(color: Colors.black12, width: 1),
                  ),
                 child:Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 20,
                        child: Container(
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/ICON-EMEC.png',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 80,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: double.maxFinite,
                                color: Color(0xff261350),
                                child: Text("${litems[position].datetime}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                              ),
                              Container(
                                child: Text("${litems[position].shortname}\n",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                child: Text("${litems[position].discription}\n"),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
