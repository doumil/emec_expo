import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:emec_expo/Busniess%20Safe.dart';
import 'package:emec_expo/Congress.dart';
import 'package:emec_expo/Contact.dart';
import 'package:emec_expo/Exhibitors.dart';
import 'package:emec_expo/Expo%20Floor%20Plan.dart';
import 'package:emec_expo/Food.dart';
import 'package:emec_expo/How%20to%20get%20there.dart';
import 'package:emec_expo/Information.dart';
import 'package:emec_expo/Media%20Partners.dart';
import 'package:emec_expo/News.dart';
import 'package:emec_expo/Notifications.dart';
import 'package:emec_expo/Official%20events.dart';
import 'package:emec_expo/Settings.dart';
import 'package:emec_expo/Social%20Media.dart';
import 'package:emec_expo/Speakers.dart';
import 'package:emec_expo/details/DayEventMenu.dart';
import 'package:emec_expo/details/DetailCongress.dart';
import 'package:emec_expo/partners.dart';
import 'package:emec_expo/product.dart';
import 'package:emec_expo/services/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:emec_expo/home_screen.dart';
import 'package:googleapis/admin/reports_v1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Activities.dart';
import 'My Agenda.dart';
import 'Suporting Partners.dart';
import 'details/CongressMenu.dart';
import 'details/DetailExhibitors.dart';
import 'model/notification_model.dart';
import 'model/user_scanner.dart';
import 'my_drawer_header.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Schedule.dart';
import 'database_helper/database_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;

var db = new DataBaseHelperNotif();
var  name="1",date="1",dtime="1",discription="1";
var fbm=FirebaseMessaging.instance;

Future _onMessage(RemoteMessage event) async{
  name=event.notification!.title.toString();
  date="${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
  dtime="${DateTime.now().hour}:${DateTime.now().minute}";
  discription=event.notification!.body.toString();
  if(name=="missed notification"){
    print("notification not save");
  }
  else{
    await db.saveNoti(NotifClass(name, date, dtime, discription));
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  HttpOverrides.global = new MyHttpOverrides();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getBool("isChecked1");
  prefs.getBool("isChecked2");
  prefs.getBool("isChecked3");
  Timer.periodic(Duration(seconds: 5), (timer) {
    myMethod();
  });
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(
    _onMessage
  );
  runApp(MyApp());
}
sendNotify(String title, String body, String id) async {
  final String serverToken = 'AAAAVy_P_0g:APA91bGckzY8RIWOLFp7TK36FOB4yaJCaQdU-en_Q-BUN2rfiK9bgvZMuEs8HslL7_EGIwW20y9cJISstJmiXvDCq4LridWcWhlDG-YZajFkeFU19v-R_iu8EQHT0F7BdSe6vW0XSLMz';
  await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(<String, dynamic>{
        'notification': <String, dynamic>{
          'title': '$title',
          'body': '$body',
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

}
onMessage(){
  FirebaseMessaging.onMessage.listen((event) {
    //FlutterRingtonePlayer.playNotification();
    String? title,body;
    print("test 2");
    title=event.notification?.title.toString();
    body=event.notification?.body.toString();
    NotificationService().NotifDataChanged(
        title:title,
        body:body);
    print(event.notification?.title.toString());
    print(event.notification?.body.toString());
    //Get.snackbar(title!,body!);
  });
}
List<Userscan> litems = [];
int count=0;
void myMethod() async{
  var id =33;
  var url = "https://okydigital.com/buzz_login/loadsync.php";
  //var res = await http.get(Uri.parse(url));
  var data = {
    "id_buzz":id.toString(),
  };
  var res = await http.post(Uri.parse(url), body: data);
  //String jsn ='[{"id":"17","firstname":"yassine","lastname":"doumil","company":"okysolutions","email":"yassinedoumil96@gmail.com","phone":"06877778787","adresse":"hay hassani casablanca","evolution":"bonne","action":"14","notes":"note1","created":"","updated":null},{"id":"18","firstname":"amine","lastname":"faouzi","company":"okysolutions","email":"amine.normane@gmail.com","phone":"089687676","adresse":"annassi casablanca","evolution":"moyenne","action":"23","notes":"note 2","created":"","updated":null},
  // {"id":"18","firstname":"amine","lastname":"faouzi","company":"okysolutions","email":"amine.normane@gmail.com","phone":"089687676","adresse":"annassi casablanca","evolution":"moyenne","action":"23","notes":"note 2","created":"","updated":null}]';
  List<Userscan> users = (json.decode(res.body) as List)
      .map((data) => Userscan.fromJson(data))
      .toList();
  if(int.parse(users.length.toString())!=int.parse(count.toString())){
    print("data has changed");
    sendNotify("missed notification","see updates from EMEC EXPO\n that you may have missed","0");
    print("notification has show it");
  }
  print("user${users.length}");
  count=users.length;
  print("count${count}");

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MyApp1(),
      home: WelcomPage()
    );
  }
}

class WelcomPage extends StatefulWidget {
  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  var currentPage = DrawerSections.home;
  var _data="";
  late SharedPreferences prefs;
  void initState() {
    //_onMessage();
    _goTo_notification_back();
    _loadData();
    super.initState();
  }
  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _data = (prefs.getString("Data") ?? '');
    //prefs.setBool("isChecked1",true);
    print("-------------$_data------------------");
    setState(() {
      if(_data=="1")
      {
        currentPage=DrawerSections.exhibitors;
      }
      else if(_data=="2")
        {
          currentPage=DrawerSections.congressmenu;

        }
      else if(_data=="3")
        {
          currentPage=DrawerSections.business;

        }
      else if(_data=="4")
        {
          currentPage=DrawerSections.notifications;

        }
      else if(_data=="5")
        {
          currentPage=DrawerSections.congressmenu;

        }
      else if(_data=="6")
        {
          currentPage=DrawerSections.detailexhib;

        }
      else if(_data=="7")
        {
          currentPage=DrawerSections.detailcongress;

        }
      else
        {
          currentPage=DrawerSections.home;
        }
    });

  }
  _goTo_notification_back() async{
    FirebaseMessaging.onMessageOpenedApp.listen((event) async{
      prefs = await SharedPreferences.getInstance();
      prefs.setString("Data","4");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WelcomPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = HomeScreen();
    }
    else if (currentPage == DrawerSections.agenda) {
      container = MyAgendaScreen();
    }
    else if (currentPage == DrawerSections.congress) {
      container = CongressScreen();
    }
    else if (currentPage == DrawerSections.speakers) {
      container = SpeakersScreen();
    }
    else if (currentPage == DrawerSections.officialEvents) {
      container = OfficialEventsScreen();
    }
    else if (currentPage == DrawerSections.partners) {
      container = PartnersScreen();
    }
    else if (currentPage == DrawerSections.exhibitors) {
      container = ExhibitorsScreen();
    }
    /*
    else if (currentPage == DrawerSections.product) {
      container = ProductScreen();
    }
    else if (currentPage == DrawerSections.act) {
      container = ActivitesScreen();
    }
    else if (currentPage == DrawerSections.news) {
      container = NewsScreen();
    }
     */
    else if (currentPage == DrawerSections.eFP) {
      container = EFPScreen();
    }
    else if (currentPage == DrawerSections.supportingP) {
      container = SupportingPScreen();
    }
    else if (currentPage == DrawerSections.mediaP) {
      container = MediaPScreen();
    }
    else if (currentPage == DrawerSections.socialM) {
      container = SocialMScreen();
    }
    else if (currentPage == DrawerSections.contact) {
      container = ContactScreen();
    }
    else if (currentPage == DrawerSections.information) {
      container = InformationScreen();
    }
    else if (currentPage == DrawerSections.schedule) {
      container = SchelduleScreen();
    }
    else if (currentPage == DrawerSections.getThere) {
      container = GetThereScreen();
    }
    //else if (currentPage == DrawerSections.food) {
      //container = FoodScreen();
    //}
    //else if (currentPage == DrawerSections.business) {
      //container = BusinessScreen();
    //}
    else if (currentPage == DrawerSections.notifications) {
      container = NotificationsScreen();
    }
    else if (currentPage == DrawerSections.settings) {
      container = SettingsScreen();
    }
    else if (currentPage == DrawerSections.congressmenu) {
      container = CongressMenu();
    }   
    else if (currentPage == DrawerSections.detailcongress) {
      container = DetailCongressScreen(check: false,);
    }
    else if (currentPage == DrawerSections.detailexhib) {
      container = DetailExhibitorsScreen();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("EMEC EXPO"),
        backgroundColor: Color(0xff261350),
        actions: <Widget>[],
        elevation: 0,
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                const SizedBox(
                  height: 05.0,
                ),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home_outlined,
              currentPage == DrawerSections.home ? true : false,false),
          menuItem(2, "My Agenda", Icons.calendar_today,
              currentPage == DrawerSections.agenda ? true : false,false),
          menuItem(3, "Congress", Icons.web,
              currentPage == DrawerSections.congressmenu ? true : false,false),
          menuItem(4, "Speakers", Icons.speaker_group_outlined,
              currentPage == DrawerSections.speakers ? true : false,false),
          //menuItem(5, "Official Events", Icons.event,
              //currentPage == DrawerSections.officialEvents ? true : false),
          menuItem(6, "Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.partners ? true : false,false),
          menuItem(7, "Exhibitors", Icons.work_outline,
              currentPage == DrawerSections.exhibitors ? true : false,currentPage == DrawerSections.product || currentPage == DrawerSections.act || currentPage == DrawerSections.news? true : false),
          /*
        Padding(
              padding: EdgeInsets.only(left: 35.0),
            child: menuItem(8, "Product", Icons.all_inbox,
                currentPage == DrawerSections.product ? true : false,currentPage == DrawerSections.product  ? true : false),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35.0),
            child: menuItem(9, "Activities", Icons.local_activity_outlined,
                currentPage == DrawerSections.act ? true : false,false),
          ),
          Padding(
            padding: EdgeInsets.only(left: 35.0),
            child: menuItem(10, "News", Icons.insert_drive_file_outlined,
                currentPage == DrawerSections.news ? true : false,false),
          ),
        */
          menuItem(11, "Expo Floor Plan", Icons.location_on_outlined,
              currentPage == DrawerSections.eFP ? true : false,false),
          menuItem(12, "Suporting Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.supportingP ? true : false,false),
          menuItem(13, "Media Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.mediaP ? true : false,false),
          menuItem(14, "Social Media", Icons.language,
              currentPage == DrawerSections.socialM ? true : false,false),
          menuItem(15, "Contact", Icons.contact_phone_outlined,
              currentPage == DrawerSections.contact ? true : false,false),
          menuItem(16, "Information", Icons.info_outline,
              currentPage == DrawerSections.information ? true : false,currentPage==DrawerSections.schedule ? true : false),
          Padding(
            padding: EdgeInsets.only(left: 35.0),
            child: menuItem(17, "Schedule", Icons.schedule,
                currentPage == DrawerSections.schedule ? true : false,currentPage==DrawerSections.information ? true : false),
          ),
          menuItem(18, "How to get there", Icons.map,
              currentPage == DrawerSections.getThere ? true : false,false),
         // menuItem(19, "Food", Icons.fastfood_outlined,
           //   currentPage == DrawerSections.food ? true : false),
          //menuItem(20, "Business Safe", Icons.health_and_safety_outlined,
            //  currentPage == DrawerSections.business ? true : false),
          menuItem(21, "Notifications", Icons.notifications_none,
              currentPage == DrawerSections.notifications ? true : false,false),
          menuItem(22, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false,false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected,bool childSelected) {
    var color=Colors.grey[300];
    if(childSelected==true)
      {
        selected=true;

      }
    return Material(
      color: selected? color: Colors.transparent,
       shape:Border(
         bottom: selected ? BorderSide(width: 0.4, color: Colors.black12) :BorderSide(width: 0.0, color: Colors.transparent),
       ),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            }else if (id == 2) {
              currentPage = DrawerSections.agenda;
            }
            else if (id == 3) {
              currentPage = DrawerSections.congressmenu;
            }
            else if (id == 4) {
              currentPage = DrawerSections.speakers;
            }
            else if (id == 5) {
              currentPage = DrawerSections.officialEvents;
            }
            else if (id == 6) {
              currentPage = DrawerSections.partners;
            }
            else if (id == 7) {
              currentPage = DrawerSections.exhibitors;
            }
            else if (id == 8) {
              currentPage = DrawerSections.product;

            }
            else if (id == 9) {
              currentPage = DrawerSections.act;
            }
            else if (id == 10) {
              currentPage = DrawerSections.news;
            }
            else if (id == 11) {
              currentPage = DrawerSections.eFP;
            }
            else if (id == 12) {
              currentPage = DrawerSections.supportingP;
            }
            else if (id == 13) {
              currentPage = DrawerSections.mediaP;
            }
            else if (id == 14) {
              currentPage = DrawerSections.socialM;
            }
            else if (id == 15) {
              currentPage = DrawerSections.contact;
            }
            else if (id == 16) {
              currentPage = DrawerSections.information;
            }
            else if (id == 17) {
              currentPage = DrawerSections.schedule;
            }
            else if (id == 18) {
              currentPage = DrawerSections.getThere;
            }
            else if (id == 19) {
              currentPage = DrawerSections.food;
            }
            else if (id == 20) {
              currentPage = DrawerSections.business;
            }
            else if (id == 21) {
              currentPage = DrawerSections.notifications;
            }
            else if (id == 22) {
              currentPage = DrawerSections.settings;
            }
          });
        },
        child: Container(
          padding: EdgeInsets.only(left: 8.0,right: 20.0,top: 12.0,bottom: 12.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  size: 27,
                  color:Color(0xff00c1c1),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xff261350),
                    fontSize: 17.2,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

enum DrawerSections {
  home,
  agenda,
  congress,
  speakers,
  officialEvents,
  partners,
  exhibitors,
  product,
  act,
  news,
  eFP,
  supportingP,
  mediaP,
  socialM,
  contact,
  information,
  schedule,
  getThere,
  food,
  business,
  notifications,
  congressmenu,
  settings,
  detailexhib,
  detailcongress
}