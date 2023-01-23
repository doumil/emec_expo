import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LINKEDINScreen extends StatefulWidget {
  const LINKEDINScreen ({Key? key}) : super(key: key);

  @override
  _LINKEDINScreenState createState() => _LINKEDINScreenState();
}

class _LINKEDINScreenState extends State<LINKEDINScreen> {
  bool isLoading=true;
  final _key = UniqueKey();
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://www.linkedin.com/company/emecexpo/?originalSubdomain=ma',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center( child: SpinKitThreeBounce(
            color: Color(0xff00c1c1),
            size: 30.0,
          ),)
              : Stack(),
        ],
      ),
    );
  }
}