import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'model/product_model.dart';
import 'package:http/http.dart' as http;
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductClass> litems = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }
  _loadData() async {
   // var url = "http://192.168.8.100/emecexpo/loadproduct.php";
    //var res = await http.post(Uri.parse(url));
    //List<ProductClass> prod = (json.decode(res.body) as List)
      //  .map((data) => ProductClass.fromJson(data))
        //.toList();
    //litems=prod;
    var prod1=ProductClass("Appinio","Appinio","100% Digital mortage EVO","");
    litems.add(prod1);
    var prod2=ProductClass("IotSesns","IotSesns","AMR Gatway","");
    litems.add(prod2);
    var prod3=ProductClass("RED.sos","REDSHIFT GLOBAL","Adaptive Soc Services","");
    litems.add(prod3);
    var prod4=ProductClass("Agency 04","Automating 30+ processes using Camunda BPM","","");
    litems.add(prod4);
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
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
          body: isLoading == true
              ? Center(
              child: SpinKitThreeBounce(
                color: Color(0xff00c1c1),
                size: 30.0,
              ))
              : Container(
            color: Colors.white,
            child: new ListView.builder(
                itemCount: litems.length,
                itemBuilder: (_, int position) {
                  return new Card(
                    color: Colors.white,
                    shape: BorderDirectional(
                      bottom:BorderSide(color: Colors.black12, width: 1),
                    ),
                    child: new ListTile(
                      leading: new ClipOval(
                          child: Image.asset(
                            'assets/ICON-EMEC.png',
                          ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "${litems[position].name}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle:Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "${litems[position].shortname}\n${litems[position].shortdiscription}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                      },
                    ),
                  );
                }),
          ),
        ));
  }
}
