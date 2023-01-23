import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';


class PartnersScreen extends StatefulWidget {
  const PartnersScreen({Key? key}) : super(key: key);

  @override
  _PartnersScreenState createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Êtes-vous sûr'),
        content: new Text('Voulez-vous quitter cette application'),
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
          body: SingleChildScrollView(
            child: FadeInDown(
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  //technopark/ammc
                     Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(top: height * 0.01),
                            //padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Image.asset(
                              "assets/partners/technopark.png",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(top: height * 0.01),
                            // padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Image.asset(
                              "assets/partners/ammc.png",
                            ),
                          ),
                        ),
                      ],
                    ),
            Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(top: height * 0.01),
                            //padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Image.asset(
                              "assets/partners/cicp.png",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(top: height * 0.01),
                            // padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Image.asset(
                              "assets/partners/lastartupstation.png",
                            ),
                          ),
                        ),
                      ],
                    ),
Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/nortis.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/okysolutions.png",
                          ),
                        ),
                      ),
                    ],
                  ),
               Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(top: height * 0.01),
                            //padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Image.asset(
                              "assets/partners/buzzevents.png",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(top: height * 0.01),
                            // padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Image.asset(
                              "assets/partners/tdm.png",
                            ),
                          ),
                        ),
                      ],
                    ),
            Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(top: height * 0.01),
                            //padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Image.asset(
                              "assets/partners/es2im.png",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.only(top: height * 0.01),
                            // padding: EdgeInsets.only(bottom: height * 0.01),
                            child: Image.asset(
                              "assets/partners/ahk.png",
                            ),
                          ),
                        ),
                      ],
                    ),

                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/diplomatique.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/telecontact.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/kerixnet.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/kompass.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/infomediaire.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/aujourdhui.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/industrie-du-maroc.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/lebrief.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/media7.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/conso-news.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/hitradio.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/partners/medi1tv.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.04),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/medi1radio.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
