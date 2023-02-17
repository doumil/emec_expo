import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //color:Color(0xffffffff),
        width: double.infinity,
        //height: 179,
        //padding: EdgeInsets.only(top: 20.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/drawer.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.26,
                  /*
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    //padding: EdgeInsets.only(right: 10.0,left: 10.0),
                    child: Image.asset(
                      "assets/logo16.png",
                    ),
                  )
                  */
              ),
            ]));
  }
}
