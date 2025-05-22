import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GetThereScreen extends StatefulWidget {
  const GetThereScreen ({Key? key}) : super(key: key);

  @override
  _GetThereScreenState createState() => _GetThereScreenState();
}

class _GetThereScreenState extends State<GetThereScreen> {
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
          body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://www.google.com/maps/place/Foire+Internationale+De+Casablanca/@33.6044593,-7.6291446,17z/data=!3m1!4b1!4m6!3m5!1s0xda7d389daa94585:0x2f99e524f1deb6d3!8m2!3d33.6044593!4d-7.6291446!16s%2Fg%2F11fj7j9mkh?entry=ttu',
          ),
        ));
  }
}
