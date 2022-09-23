import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            child: Container(
              child: Column(
                children: [
                  //technopark
                  Center(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.only(top: height * 0.01),
                      //padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Image.asset(
                        "assets/partners/technopark.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.only(top: height * 0.01),
                      //padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Image.asset(
                        "assets/partners/ammc.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      margin: EdgeInsets.only(top: height * 0.01),
                      //padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Image.asset(
                        "assets/partners/cicp.png",
                      ),
                    ),
                  ),
                  //la startup
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.01),
                      //padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Image.asset(
                        "assets/partners/lastartupstation.png",
                      ),
                    ),
                  ),
                  //nortis
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.01),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/nortis.png",
                      ),
                    ),
                  ),
                  //okysolutions
                  Center(
                    child: Container(
                      height: 150,
                     // margin: EdgeInsets.only(top: height * 0.08),
                      //padding: EdgeInsets.only(bottom: height * 0.06),
                      child: Image.asset(
                        "assets/partners/okysolutions.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.08),
                      //padding: EdgeInsets.only(bottom: height * 0.06),
                      child: Image.asset(
                        "assets/partners/buzzevents.png",
                      ),
                    ),
                  ),            Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.08),
                      //padding: EdgeInsets.only(bottom: height * 0.06),
                      child: Image.asset(
                        "assets/partners/tdm.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                     // margin: EdgeInsets.only(top: height * 0.01),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/es2im.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.04),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/ahk.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.04),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/diplomatique.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.04),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/telecontact.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.04),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/kerixnet.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                     // margin: EdgeInsets.only(top: height * 0.04),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/kompass.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                     // margin: EdgeInsets.only(top: height * 0.04),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/infomediaire.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      //margin: EdgeInsets.only(top: height * 0.04),
                      //padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/Aujourdhui.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.04),
                      padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/industrie.jpg",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.04),
                      padding: EdgeInsets.only(bottom: height * 0.04),
                      width: 340,
                      child: Image.asset(
                        "assets/partners/lebrif.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.04),
                      padding: EdgeInsets.only(bottom: height * 0.04),
                      width: 340,
                      child: Image.asset(
                        "assets/partners/conso.jpg",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.04),
                      padding: EdgeInsets.only(bottom: height * 0.04),
                      width: 200,
                      height:200,
                      child: Image.asset(
                        "assets/partners/hitradio.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.04),
                      padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/medi1tv.png",
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.04),
                      padding: EdgeInsets.only(bottom: height * 0.04),
                      child: Image.asset(
                        "assets/partners/mediradio.png",
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
