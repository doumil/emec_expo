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
            initialUrl: 'https://www.google.com/maps/place/Hyatt+Regency+Casablanca/@33.5961817,-7.6210396,17z/data=!3m1!4b1!4m8!3m7!1s0xda7d284d7ccd05f:0xd0a597e123812ee5!5m2!4m1!1i2!8m2!3d33.5961773!4d-7.6188509',
          ),
        ));
  }
}
