import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/model/notification_model.dart';
import 'package:emec_expo/services/local_notification_service.dart';
import 'package:emec_expo/services/onwillpop_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Busniess Safe.dart';
import 'Notifications.dart';
import 'database_helper/database_helper.dart';
import 'main.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //DateTime date1=DateTime.parse("2023-02-24 11:10");
  var db = new DataBaseHelperNotif();
  String name = "1", date = "1", dtime = "1", discription = "1";
  var fbm = FirebaseMessaging.instance;
  late SharedPreferences prefs;
  void initState() {
    _loadData();
    //_goTo_notification_terminate();
    fbm.getToken().then((token) {
      print("----------- token ------------");
      print(token);
      print("------------------------------------------------");
    });
    super.initState();
  }

/*
_goTo_notification_terminate() async{
    prefs = await SharedPreferences.getInstance();
   var msg=await FirebaseMessaging.instance.getInitialMessage();
   if(msg!=null)
     {
       name=msg.notification!.title.toString();
       date="${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
       dtime="${DateTime.now().hour}:${DateTime.now().minute}";
       discription=msg.notification!.body.toString();

       prefs.setString("Data", "4");
       prefs.setString("name",name);
       prefs.setString("date",date);
       prefs.setString("dtime",dtime);
       prefs.setString("discription",discription);
       Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => WelcomPage()));
     }

}
*/
  _loadData() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("Data", "0");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    OnWillPop on = OnWillPop();
    return WillPopScope(
      onWillPop:on.onWillPop1,
      child: Scaffold(
          body: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2!,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Container(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Container(
                        // A fixed-height child.
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              color: Color(0xff261350),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 11,
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.035),
                                          width: width * 0.47,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  height: height * 0.03,
                                                  margin: EdgeInsets.only(
                                                      bottom: height * 0.01),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                          margin: EdgeInsets.only(
                                                              right: 5),
                                                          child: Icon(
                                                            Icons.event_note,
                                                            size: height * 0.02,
                                                            color: Colors.white,
                                                          )),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: width * 0.4,
                                                          child: Text(
                                                            "10-11 Mai 2023",
                                                            style: TextStyle(
                                                                fontSize: height *
                                                                    0.018,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color:
                                                                    Colors.white),
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          ))),
                                  Container(
                                    height: height * 0.06,
                                    width: 0.7,
                                    color: const Color(0xff00c1c1),
                                  ),
                                  Expanded(
                                      flex: 11,
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.035),
                                          width: width * 0.47,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  height: height * 0.03,
                                                  margin: EdgeInsets.only(
                                                      bottom: height * 0.01),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Container(
                                                          margin: EdgeInsets.only(
                                                              right: 5),
                                                          child: Icon(
                                                            Icons.location_on,
                                                            size: height * 0.02,
                                                            color: Colors.white,
                                                          )),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: width * 0.4,
                                                          child: Text(
                                                            "Hôtel Hyatt Regency Casablanca",
                                                            style: TextStyle(
                                                                fontSize: height *
                                                                    0.018,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color:
                                                                    Colors.white),
                                                            overflow: TextOverflow
                                                                .visible,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          ))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: FadeInDown(
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              color: Colors.black26, // white
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                width * 0.04,
                                                width * 0.04,
                                                width * 0.04,
                                                width * 0.01),
                                            child: Image.asset(
                                              "assets/banner.png",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: height * 0.01),
                                    padding:
                                        EdgeInsets.only(bottom: height * 0.01),
                                    width: width * 0.9,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            height: 350,
                                            width: 500,
                                            padding: EdgeInsets.fromLTRB(
                                                width * 0.04,
                                                width * 0.04,
                                                width * 0.04,
                                                width * 0.01),
                                            child: CarouselSlider(
                                              enableAutoSlider: true,
                                              autoSliderDelay:
                                                  const Duration(seconds: 2),
                                              slideTransform: CubeTransform(),
                                              unlimitedMode: true,
                                              slideIndicator:
                                                  CircularSlideIndicator(
                                                    itemSpacing: 16,
                                                    indicatorRadius:4,
                                                padding:
                                                    EdgeInsets.only(bottom: 1),
                                                currentIndicatorColor:
                                                    const Color(0xff00c1c1),
                                                indicatorBackgroundColor:
                                                Color(0xff261350),
                                              ),
                                              children: [
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/ahkslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/buzzslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/cicpslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/courseslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/hackslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/infoslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/itslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/kompslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/lodjslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/richslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/storyslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/technoslide.png",
                                                  ),
                                                ),
                                                Container(
                                                  child: Image.asset(
                                                    "assets/slides/teleslide.png",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: height * 0.01),
                                    padding:
                                        EdgeInsets.only(bottom: height * 0.01),
                                    width: width * 0.9,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.work_outline,
                                                size: 27,
                                                color: Color(0xff00c1c1),
                                              ),
                                              title: Text('Exhibitors',
                                                  style: (TextStyle(
                                                      color: Color(0xff261350),
                                                      fontSize: 17.2,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                              onTap: () async {
                                                prefs = await SharedPreferences
                                                    .getInstance();
                                                prefs.setString("Data", "1");
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            WelcomPage()));
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(
                                        top: height * 0.01,
                                        bottom: height * 0.01),
                                    padding:
                                        EdgeInsets.only(bottom: height * 0.01),
                                    width: width * 0.9,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            child: ListTile(
                                              leading: Icon(Icons.web,
                                                size: 27,
                                                color:Color(0xff00c1c1),
                                              ),
                                              title: Text('Congress',
                                                  style: (TextStyle(
                                                      color: Color(0xff261350),
                                                      fontSize: 17.2,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                              onTap: () async {
                                                prefs = await SharedPreferences
                                                    .getInstance();
                                                prefs.setString("Data", "2");
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            WelcomPage()));
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    margin:
                                        EdgeInsets.only(bottom: height * 0.01),
                                    padding:
                                        EdgeInsets.only(bottom: height * 0.01),
                                    width: width * 0.9,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                  ),
/*                                Container(
                                    child:TextButton(child: Text("click me"),onPressed: (){
                                      NotificationService().showNotifByDate(
                                          title: 'EMEC EXPO', body: "Performing hot reload..."
                                          "Syncing files to device CPH1819..."
                                          "Reloaded 2 of 1626 libraries in 1 958ms (compile: 151 ms, reload: 711 ms, reassemble: 577 ms.",date:date1
                                      );*/
/*                                    NotificationService()
                                          .showNotification(title: 'EMEC EXPO', body: "Performing hot reload..."
                                          "Syncing files to device CPH1819..."
                                          "Reloaded 2 of 1626 libraries in 1 958ms (compile: 151 ms, reload: 711 ms, reassemble: 577 ms.");
                                          */
                      /*              }
                                    ),
                                  ),*/
                                  /*Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Center(
                                          child: Container(
                                            child:
                                            ListTile(
                                              leading: Icon(Icons.health_and_safety_outlined),
                                              title: Text('Business Safe'),
                                    onTap: () async{
                                      prefs = await SharedPreferences.getInstance();
                                      prefs.setString("Data", "3");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WelcomPage()));
                                    },
                                          ),
                                        ),
                                        )],
                                    ),
                                    margin: EdgeInsets.only(
                                        top: height * 0.01, bottom: height * 0.01),
                                    padding: EdgeInsets.only(bottom: height * 0.01),
                                    width: width * 0.9,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
