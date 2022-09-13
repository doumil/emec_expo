import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramScreen extends StatefulWidget {
  const InstagramScreen ({Key? key}) : super(key: key);

  @override
  _InstagramScreenState createState() => _InstagramScreenState();
}

class _InstagramScreenState extends State<InstagramScreen> {

  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.instagram.com/emecexpo/',
      ),
    );
  }
}