import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SupportingPScreen extends StatefulWidget {
  const SupportingPScreen({Key? key}) : super(key: key);

  @override
  _SupportingPScreenState createState() => _SupportingPScreenState();
}

class _SupportingPScreenState extends State<SupportingPScreen> {
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
            child: FadeInDown(
              duration: Duration(milliseconds: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //title gold
                   Center(
                      child: Container(
                        margin: EdgeInsets.only(top: height * 0.01),
                        //padding: EdgeInsets.only(bottom: height * 0.01),
                        child: const Text("SPONSOR GOLD",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00,color: Color(0xffffb300))),
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 200,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2023/SHIPSEN.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 200,
                          margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2023/CODPARTNER.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  //title silver
                   Center(
                      child: Container(
                        //margin: EdgeInsets.only(top: height * 0.01),
                        //padding: EdgeInsets.only(bottom: height * 0.01),
                        child: const Text("SPONSOR SILVER",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00,color: Color(0xffc0c0c0))),
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 200,
                          margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2023/DROPIFY.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 200,
                          margin: EdgeInsets.only(top: height * 0.01),
                         // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2023/EDCO.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  /*
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.01),
                      //padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Image.asset(
                        "assets/sponsors/chrono-diali.png",
                      ),
                    ),
                  ),
                  */
                  //title bronze
                  Center(
                      child: Container(
                        //margin: EdgeInsets.only(top: height * 0.01),
                        //padding: EdgeInsets.only(bottom: height * 0.01),
                        child: const Text("SPONSOR BRONZE",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00,color: Color(0xffcd7f32))),
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 200,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2023/ZEN-NETWORKS.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 200,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2023/SEM.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
