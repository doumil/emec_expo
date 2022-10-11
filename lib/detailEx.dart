import 'package:emec_expo/Activities.dart';
import 'package:emec_expo/Exhibitors.dart';
import 'package:emec_expo/News.dart';
import 'package:emec_expo/product.dart';
import 'package:emec_expo/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_drawer_header.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("EMEC EXPO"),
        backgroundColor: Color(0xff261350),
        elevation: 0,
      ),
      body: DefaultTabController(
          length: 4,
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
                            text:"Exhibitors",
                          ),
                          Tab(
                            text:"Product",
                          ),
                          Tab(
                            text:"Activities",
                          ),
                          Tab(
                            text:"News",
                          ),
                        ]
                    ),

                  ),
                  Expanded(
                    child:TabBarView(children: [
                      Container(

                        child :ExhibitorsScreen(),
                      ),
                      Container(
                        child: ProductScreen(),
                      ),
                      Container(
                        child: ActivitesScreen(),
                      ),
                      Container(
                        child: NewsScreen(),
                      ),
                    ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
