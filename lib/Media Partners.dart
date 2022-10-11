import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MediaPScreen extends StatefulWidget {
  const MediaPScreen({Key? key}) : super(key: key);

  @override
  _MediaPScreenState createState() => _MediaPScreenState();
}

class _MediaPScreenState extends State<MediaPScreen> {
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
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
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
