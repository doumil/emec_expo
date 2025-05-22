import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  void initState() {
    super.initState();
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
            body: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyText2!,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints viewportConstraints) {
                  return FadeInDown(
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      color: Colors.black26,
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
                                                                    "11-13 Sept 2024",
                                                                    style: TextStyle(fontSize: height * 0.018, fontWeight: FontWeight.w300,
                                                                        color: Colors.white),
                                                                    overflow: TextOverflow.ellipsis,
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
                                                                    "International Fair - OFEC Morocco",
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
                                  child: Container(
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
                                                    "assets/logo16.png",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(top: height * 0.02),
                                          padding: EdgeInsets.only(bottom: height * 0.02),
                                          width: width * 0.9,
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                              //color:const Color(0xff5a5a5a),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                        ),
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
                                                  child: Text(
                                                    'Opening time',
                                                    style: TextStyle(fontSize: 22,color: Colors.white,fontWeight:
                                                      FontWeight
                                                      .bold,),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      width * 0.04,
                                                      width * 0.04,
                                                      width * 0.04,
                                                      width * 0.01),
                                                  child:Column(
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
                                                                      Icons.access_time,
                                                                      size: height * 0.03,
                                                                      color: Colors.white,
                                                                    )),
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child: Container(
                                                                    width: width * 0.6,
                                                                    child: Text(
                                                                      "11 September- 9h à 19h",
                                                                      style: TextStyle(
                                                                          fontSize: height *
                                                                              0.022,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          color:
                                                                          Colors.white),
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
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
                                                                      Icons.access_time,
                                                                      size: height * 0.03,
                                                                      color: Colors.white,
                                                                    )),
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child: Container(
                                                                    width: width * 0.5,
                                                                    child: Text(
                                                                      "12 September- 9h à 19h",
                                                                      style: TextStyle(
                                                                          fontSize: height *
                                                                              0.022,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          color:
                                                                          Colors.white),
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
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
                                                                      Icons.access_time,
                                                                      size: height * 0.03,
                                                                      color: Colors.white,
                                                                    )),
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child: Container(
                                                                    width: width * 0.5,
                                                                    child: Text(
                                                                      "13 September- 9h à 19h",
                                                                      style: TextStyle(
                                                                          fontSize: height *
                                                                              0.022,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          color:
                                                                          Colors.white),
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                      ]
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(top: height * 0.02),
                                          padding: EdgeInsets.only(bottom: height * 0.02),
                                          width: width * 0.9,
                                          decoration: BoxDecoration(
                                              color:const Color(0xff5a5a5a),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0))),
                                        ),
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
                                                  child: Text(
                                                    'CONTACT',
                                                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                                                        color: const Color(0xff00c1c1)),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                               // child: Text(" if you have any questions \n"
                                                 //   "or comments, please do \n"
                                                   // "not hesitate to contact us \n"
                                                    //"by phone or email.",style: TextStyle(fontSize: 22.00,color: Colors.white,fontWeight: FontWeight.bold),),
                                              ),
                                              Container(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      width * 0.04,
                                                      width * 0.04,
                                                      width * 0.04,
                                                      width * 0.01),
                                                  child:Column(
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
                                                                      Icons.phone,
                                                                      size: height * 0.034,
                                                                      color: Colors.white,
                                                                    )),
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child: Container(
                                                                    width: width * 0.6,
                                                                    child: Text(
                                                                      "(+212)669-576-718",
                                                                      style: TextStyle(
                                                                          fontSize: height *
                                                                              0.029,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          color:
                                                                          Colors.white,
                                                                      ),
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
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
                                                                      Icons.phone,
                                                                      //Icons.email_outlined,
                                                                      size: height * 0.034,
                                                                      color: Colors.white,
                                                                    )),
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child: Container(
                                                                    width: width * 0.6,
                                                                    child: Text(
                                                                      "(+33)650-357-057",
                                                                      style: TextStyle(
                                                                          fontSize: height *
                                                                              0.029,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          color:
                                                                          Colors.white),
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                      ]
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      width * 0.04,
                                                      width * 0.04,
                                                      width * 0.04,
                                                      width * 0.01),
                                                  child:Column(
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
                                                                      Icons.email_outlined,
                                                                      size: height * 0.034,
                                                                      color: Colors.white,
                                                                    )),
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child: Container(
                                                                    width: width * 0.6,
                                                                    child: Text(
                                                                      //"(+33)650-357-057",
                                                                        "b.nadia@emecexpo.ma",
                                                                      style: TextStyle(
                                                                          fontSize: height *
                                                                              0.027,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          color:
                                                                          Colors.white),
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                        Container(
                                                            height: height * 0.027,
                                                            margin: EdgeInsets.only(
                                                                bottom: height * 0.001),
                                                            child: Row(
                                                              children: <Widget>[
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        right: 5),
                                                                    child: Icon(
                                                                      Icons.email_outlined,
                                                                      size: height * 0.034,
                                                                      color: Colors.white,
                                                                    )),
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child: Container(
                                                                    width: width * 0.6,
                                                                    child: Text(
                                                                      "sales@emecexpo.ma",
                                                                      style: TextStyle(
                                                                          fontSize: height *
                                                                              0.029,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          color:
                                                                          Colors.white),
                                                                      overflow: TextOverflow
                                                                          .ellipsis,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )),
                                                      ]
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          margin: EdgeInsets.only(top: height * 0.03),
                                          padding: EdgeInsets.only(bottom: height * 0.03),
                                          width: width * 0.9,
                                          decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
        )
    );
  }
}
