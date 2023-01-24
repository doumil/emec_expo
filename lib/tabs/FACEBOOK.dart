import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class FacebookScreen extends StatefulWidget {
  const FacebookScreen ({Key? key}) : super(key: key);

  @override
  _FacebookScreenState createState() => _FacebookScreenState();
}

class _FacebookScreenState extends State<FacebookScreen> {
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
                initialUrl: 'https://web.facebook.com/EMECEXPO/?_rdc=1&_rdr',
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              isLoading ? Center( child: SpinKitThreeBounce(
                color: Color(0xff006aff),
                size: 30.0,
              ),)
                  : Stack(),
            ],
          ),
        );
  }
}
