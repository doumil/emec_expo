import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Busniess Safe.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences prefs;
  void initState() {
    _loadData();
    super.initState();
  }
  _loadData()async{
    prefs = await SharedPreferences.getInstance();
    prefs.setString("Data", "0");
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                                  color:  const Color(0xff00c1c1),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding: EdgeInsets.only(bottom: height * 0.01),
                                  width: width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          height:435,
                                          width: 500,
                                          padding: EdgeInsets.fromLTRB(
                                              width * 0.04,
                                              width * 0.04,
                                              width * 0.04,
                                              width * 0.01),
                                          child: CarouselSlider(
                                             enableAutoSlider: true,
                                             autoSliderDelay:  const Duration(seconds:4),
                                             slideTransform: CubeTransform(),
                                            unlimitedMode: true,
                                            slideIndicator: CircularSlideIndicator(
                                              padding: EdgeInsets.only(bottom: 3),
                                              currentIndicatorColor: const Color(0xff00c1c1),
                                              indicatorBackgroundColor: Colors.white12,
                                            ),
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                  "assets/slide1.jpg",
                                                ),
                                              ),
                                              Container(
                                                child: Image.asset(
                                                  "assets/slide2.jpg",
                                                ),
                                              ),
                                              Container(
                                                child: Image.asset(
                                                  "assets/slide3.jpg",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(top: height * 0.01),
                                  padding: EdgeInsets.only(bottom: height * 0.01),
                                  width: width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          child:  ListTile(
                                            leading: Icon(Icons.work_outline),
                                            title: Text('Exhibitors'),
                                            onTap: () async{
                                              prefs = await SharedPreferences.getInstance();
                                              prefs.setString("Data", "1");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => WelcomPage()));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: height * 0.01, bottom: height * 0.01),
                                  padding: EdgeInsets.only(bottom: height * 0.01),
                                  width: width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: Container(
                                          child:                ListTile(
                                            leading: Icon(Icons.web),
                                            title: Text('Congress'),
                                            onTap: () async{
                                              prefs = await SharedPreferences.getInstance();
                                              prefs.setString("Data", "2");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => WelcomPage()));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: height * 0.01, bottom: height * 0.01),
                                  padding: EdgeInsets.only(bottom: height * 0.01),
                                  width: width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                ),
                                Container(
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
                                ),
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
    ));
  }
}
