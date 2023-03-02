import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../details/DetailCongress.dart';
import '../main.dart';

class NotificationService  {
  // final  _toWelcomePage = Navigator.of(context).push(MaterialPageRoute(builder: (_)=>WelcomPage()));
  //late SharedPreferences prefs;
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
          //navigateTo();
          //prefs = await SharedPreferences.getInstance();
          //prefs.setString("Data", "7");
          runApp( new MaterialApp(debugShowCheckedModeBanner: false,home: new DetailCongressScreen(check: false,)));
        });

  }
notifdeined() async{
  await notificationsPlugin.cancelAll();
}
  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }
 /* navigateTo(BuildContext context) async{

  }*/

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }  Future NotifDataChanged(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  Future showNotifByDate(
      {int id = 0,
      String? title,
      String? body,
      String? payLoad,
      required DateTime date}) async {
    tz.initializeTimeZones();
    return notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(date, tz.local),
      await notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
