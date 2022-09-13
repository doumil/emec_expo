import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LINKEDINScreen extends StatefulWidget {
  const LINKEDINScreen ({Key? key}) : super(key: key);

  @override
  _LINKEDINScreenState createState() => _LINKEDINScreenState();
}

class _LINKEDINScreenState extends State<LINKEDINScreen> {

  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.linkedin.com/company/emecexpo/?originalSubdomain=ma',
      ),
    );
  }
}