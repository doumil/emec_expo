import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FacebookScreen extends StatefulWidget {
  const FacebookScreen ({Key? key}) : super(key: key);

  @override
  _FacebookScreenState createState() => _FacebookScreenState();
}

class _FacebookScreenState extends State<FacebookScreen> {

  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          extendBodyBehindAppBar: true,
          body:WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://web.facebook.com/EMECEXPO/?_rdc=1&_rdr',
          ),
        );
  }
}
