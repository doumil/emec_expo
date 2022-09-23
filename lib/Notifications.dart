import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'model/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen ({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotifClass> litems = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }
  _loadData() async {
    var url = "http://192.168.8.100/emecexpo/loadspeakers.php";
    var res = await http.post(Uri.parse(url));
    List<NotifClass> notif = (json.decode(res.body) as List)
        .map((data) => NotifClass.fromJson(data))
        .toList();
    litems=notif;
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
              : new ListView.builder(
              itemCount: litems.length,
              itemBuilder: (_, int position) {
                return new Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50.0),
                        right: Radius.circular(0.0),
                      )
                  ),
                  child: new ListTile(
                    leading: new ClipOval(
                        child: Image.asset(
                          'assets/av.jpg',
                        )),
                    title:Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text("${litems[position].name} ${litems[position].dtime} ${litems[position].dtime}",
                        style: TextStyle(color: Colors.white70, fontSize: 15,fontWeight:FontWeight.bold),
                      ),
                    ),
                    subtitle: new Text("${litems[position].discriptions}",
                      style: TextStyle(color: Colors.white70,height: 2),
                    ),
                    trailing: Wrap(
                      children: [
                        Text("\n",
                            style: TextStyle(color: Colors.white70, fontSize: 15,fontWeight:FontWeight.bold)),
                      ],
                    ),
                    onTap: (){},
                  ),
                  color: Color(0xff682062),
                  elevation: 3.0,
                );
              }),
        ));
  }
}
