import 'package:emec_expo/tabs/FACEBOOK.dart';
import 'package:emec_expo/tabs/INSTAGRAM.dart';
import 'package:emec_expo/tabs/LINKEDIN.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMScreen extends StatefulWidget {
  const SocialMScreen({Key? key}) : super(key: key);

  @override
  _SocialMScreenState createState() => _SocialMScreenState();
}

class _SocialMScreenState extends State<SocialMScreen> {
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
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: Container(
            child: Column(
              children: [
               Container(
                 color: Color(0xff261350),
                 child: TabBar(
                     unselectedLabelColor: const Color(0xff00c1c1),
                     labelColor:Colors.white,
                     tabs:[
                       Tab(
                         child: Text("FACEBOOK"),
                       ),
                       Tab(
                         text:"INSTAGRAM",
                       ),
                       Tab(
                         text:"LINKEDIN",
                       )
                     ]
                 ),

               ),
                Expanded(
                    child:TabBarView(children: [
                      Container(
                        child :FacebookScreen(),
                      ),
                      Container(
                        child: InstagramScreen(),
                      ),
                      Container(
                        child: LINKEDINScreen(),
                      ),
                    ],
                    ),
                ),
              ],
            ),
          ),
        ));
  }
}
