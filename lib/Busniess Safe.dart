import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen ({Key? key}) : super(key: key);

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
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
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: Container(
            color: Color(0x37e9edef),
            child: Column(
              children: [
                Text("Business Safe"),
              ],
            ),
          ),
        ));
  }
}
