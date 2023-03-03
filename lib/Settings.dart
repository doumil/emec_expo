import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/services/local_notification_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:emec_expo/services/onwillpop_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_mute/flutter_mute.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final String serverToken = 'AAAAVy_P_0g:APA91bGckzY8RIWOLFp7TK36FOB4yaJCaQdU-en_Q-BUN2rfiK9bgvZMuEs8HslL7_EGIwW20y9cJISstJmiXvDCq4LridWcWhlDG-YZajFkeFU19v-R_iu8EQHT0F7BdSe6vW0XSLMz';
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  //MobileScannerController torchctlr = MobileScannerController();
  late SharedPreferences prefs;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool _isEnabled = true;
// Replace with server token from firebase console settings.
  void initState() {
    _subscribe();
    //onMessage();
    _loadData();
    super.initState();
  }
_loadData() async{
  prefs = await SharedPreferences.getInstance();
  bool? ch=prefs.getBool("isChecked1");
  bool? ch1=prefs.getBool("isChecked2");
  bool? ch2=prefs.getBool("isChecked3");
  setState(() {
    if(ch==null||ch1==null||ch2==null){
      print("null");
    }
    else{
      isChecked1=ch!;
      isChecked2=ch1!;
      isChecked3=ch2!;
    }
    //print(isChecked2);
  });
}
/*  sendNotify(String title, String body, String id) async {
    await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
        body: jsonEncode(<String, dynamic>{
          'notification': <String, dynamic>{
            'body': '$title',
            'title': '$body',
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': id,
            'status': 'done'
          },
          'to': '/topics/Rec'
          //await messaging.getToken(),
        }));

  }*/
/*  onMessage(){
    FirebaseMessaging.onMessage.listen((event) {
      //FlutterRingtonePlayer.playNotification();
      String? title,body;
      title=event.notification?.title.toString();
      body=event.notification?.body.toString();
      NotificationService().NotifDataChanged(
          title:title,
          body:body);
      print(event.notification?.title.toString());
      print(event.notification?.body.toString());
      //Get.snackbar(title!,body!);
    });
  }*/

  _onChangedtrue() async{
    if(isChecked2==false){
      bool isAccessGranted = await FlutterMute.isNotificationPolicyAccessGranted;
      if (!isAccessGranted) {
        // Opens the notification settings to grant the access.
        await FlutterMute.openNotificationPolicySettings();
      }
      //RingerMode? mode;
      try {
        //mode = await FlutterMute.getRingerMode();
        await FlutterMute.setRingerMode(RingerMode.Normal);
        //print("_____________${mode}");
      } catch (err) {
        print(err);
      }
    }
    //print(isChecked1);
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isChecked1",isChecked1);
    prefs.setBool("isChecked2",isChecked2);
    prefs.setBool("isChecked3",isChecked3);
    await FirebaseMessaging.instance.unsubscribeFromTopic("Rec");
    //print("unisbscribe");
    if(isChecked1==false){
      setState(() {
        _isEnabled = !_isEnabled;
      });
    }

  }
  torch() async {
    // torchctlr.toggleTorch();
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    OnWillPop on = OnWillPop();
    return WillPopScope(
        onWillPop:on.onWillPop1,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: FadeInDown(
            duration: Duration(milliseconds: 500),
            child: Container(
              margin: EdgeInsets.only(top: height * 0.01),
              padding:
                  EdgeInsets.only(bottom: height * 0.02, top: height * 0.02),
              width: width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Column(children: <Widget>[
                        Container(
                            child: Row(children: <Widget>[
                          Container(
                              padding:
                                  EdgeInsets.fromLTRB(width * 0.045, 0, 0, 0),
                              child: Checkbox(
                                value: isChecked1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked1 = value!;
                                    if (isChecked1 == false) {
                                      _onChangedtrue();
                                    } else {
                                    _onChangedfalse();
                                    }
                                  });
                                },
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Text('Receive Notification',
                                  style: TextStyle(fontSize: height * 0.022))),
                        ])),
                        new Divider(
                          color: Color.fromRGBO(150, 150, 150, 0.4),
                          height: 5.0,
                        ),
                        Container(
                          child: ListTile(
                            onTap: () async{
                              AppSettings.openSoundSettings();
                            },
                            title: new Text("Tone"),
                            subtitle: new Text("notification_001"),
                          ),
                        ),
                        new Divider(
                          color: Color.fromRGBO(150, 150, 150, 0.4),
                          height: 5.0,
                        ),
                        Container(
                            child: Row(children: <Widget>[
                          Container(
                              padding:
                                  EdgeInsets.fromLTRB(width * 0.045, 0, 0, 0),
                              child: Checkbox(
                                value: isChecked2,
                                onChanged: _isEnabled
                                    ? (bool? value) {
                                        setState(() {
                                          isChecked2 = value!;
                                          if (isChecked2 == false) {
                                            _onChangedtrue();
                                          } else {
                                            _onChangedfalse();
                                            HapticFeedback.vibrate();
                                          }
                                        });
                                      }
                                    : null,
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Text('Vibrate',
                                  style: TextStyle(
                                    fontSize: height * 0.022,
                                  ))),
                        ])),
                        new Divider(
                          color: Color.fromRGBO(150, 150, 150, 0.4),
                          height: 5.0,
                        ),
                       /* Container(
                            child: Row(children: <Widget>[
                          Container(
                              padding:
                                  EdgeInsets.fromLTRB(width * 0.045, 0, 0, 0),
                              child: Checkbox(
                                value: isChecked3,
                                onChanged: _isEnabled
                                    ? (bool? value) {
                                        setState(() {
                                          isChecked3 = value!;
                                          if (isChecked3 == false) {
                                            _onChangedtrue();
                                          } else {
                                            _onChangedfalse();
                                          }
                                          //torch();
                                        });
                                      }
                                    : null,
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Text('Blink LED',
                                  style: TextStyle(fontSize: height * 0.022))),
                        ])),*/
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _subscribe() async{
   await FirebaseMessaging.instance.subscribeToTopic("Rec");
  }

  void _onChangedfalse() async{
    if(isChecked2==true) {
      bool isAccessGranted = await FlutterMute.isNotificationPolicyAccessGranted;

      if (!isAccessGranted) {
        // Opens the notification settings to grant the access.
        await FlutterMute.openNotificationPolicySettings();
      }
      //RingerMode? mode;
      try {
        //mode = await FlutterMute.getRingerMode();
        await FlutterMute.setRingerMode(RingerMode.Vibrate);
        //print("_____________${mode}");
      } catch (err) {
        print(err);
      }
    }
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isChecked1",isChecked1);
    prefs.setBool("isChecked2",isChecked2);
    prefs.setBool("isChecked3",isChecked3);
    FirebaseMessaging.instance.subscribeToTopic("Rec");
    _isEnabled = true;
  }
}
/*
 ValueListenableBuilder(
                          valueListenable: torchctlr.torchState,
                          builder: (context, state, child) {
                            var t=state;
                            switch (state as TorchState) {
                              case TorchState.on:
                                return Text("${t.toString()}");
                              case TorchState.off:
                                return Text("${t.toString()}");
                            }
                          },
                        ),
 */
