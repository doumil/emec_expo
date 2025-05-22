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
                        child: const Text("Platinum Sponsors",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00,color: Color(0xFFA91DBE))),
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/platinum/1.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/platinum/2.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/platinum/3.png",
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
                          height: 100,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/platinum/4.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/platinum/5.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/platinum/6.png",
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
                          height: 90,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/platinum/7.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 90,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/platinum/8.png",
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
                        child: const Text("Gold Sponsors",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00,color: Color(0xFFA91DBE))),
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 120,
                          //margin: EdgeInsets.only(top: height * 0.00),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Gold/1.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 120,
                          //margin: EdgeInsets.only(top: height * 0.00),
                         // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Gold/2.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 120,
                          //margin: EdgeInsets.only(top: height * 0.00),
                         // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Gold/3.png",
                          ),
                        ),
                      ),
                    ],
                  ),                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 120,
                          //margin: EdgeInsets.only(top: height * 0.00),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Gold/4.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 120,
                          //margin: EdgeInsets.only(top: height * 0.00),
                         // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Gold/5.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 120,
                          //margin: EdgeInsets.only(top: height * 0.00),
                         // padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Gold/6.png",
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
                          height: 90,
                          //margin: EdgeInsets.only(top: height * 0.00),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Gold/7.png",
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
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00,color: Color(0xFFA91DBE))),
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 120,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Bronze/1.png",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 120,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/Bronze/2.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                      child: Container(
                        //margin: EdgeInsets.only(top: height * 0.01),
                        //padding: EdgeInsets.only(bottom: height * 0.01),
                        child: const Text("Strategic Partner",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.00,color: Color(0xFFA91DBE))),
                      )),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 90,
                          //margin: EdgeInsets.only(top: height * 0.01),
                          //padding: EdgeInsets.only(bottom: height * 0.01),
                          child: Image.asset(
                            "assets/sponsors/sponsors2024/StrategicPartner/1.png",
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
