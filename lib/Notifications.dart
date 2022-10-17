import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'model/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotifClass> litems = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }

  _loadData() async {
    // var url = "http://192.168.8.100/emecexpo/loadspeakers.php";
    // var res = await http.post(Uri.parse(url));
    // List<NotifClass> notif = (json.decode(res.body) as List)
    //   .map((data) => NotifClass.fromJson(data))
    // .toList();
    //litems=notif;
    var nt1=NotifClass("EMEC EXPO 2023","tue,14 jun","09:00",
        "Thank you for joining us in sixth edition"
        "of Digital Entreprise How! See you from June 10 to 11 2023");
    litems.add(nt1);
    var nt2=NotifClass("EMEC EXPO 2023","tue,14 jun","09:00",
        "Thank you for joining us in sixth edition"
        "of Digital Entreprise How! See you from June 10 to 11 2023");
    litems.add(nt2);
    var nt3=NotifClass("EMEC EXPO 2023","tue,14 jun","09:00",
        "Thank you for joining us in sixth edition"
        "of Digital Entreprise How! See you from June 10 to 11 2023");
    litems.add(nt3);
    var nt4=NotifClass("EMEC EXPO 2023","tue,14 jun","09:00",
        "Thank you for joining us in sixth edition"
        "of Digital Entreprise How! See you from June 10 to 11 2023");
    litems.add(nt4);
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
                      margin: EdgeInsets.only(
                        left: height * 0.016,
                          right: height * 0.016,
                          top: height * 0.016),
                      color: Colors.white,
                      shape: BorderDirectional(
                        bottom: BorderSide(color: Colors.black12, width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Container(
                                  //padding: EdgeInsets.only(bottom: height * 0.01),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/ICON-EMEC.png',
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 60,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "${litems[position].name}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 30,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: double.maxFinite,
                                        child: Text(
                                          "${litems[position].date} ${litems[position].dtime}",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,)
                                          ,maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("\n ${litems[position].discriptions}\n"),
                              )
                            ],
                          )
                        ],
                      ),

                    );
                  }),
        ));
  }
}
