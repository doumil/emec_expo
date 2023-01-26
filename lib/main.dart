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
import 'package:emec_expo/partners.dart';
import 'package:emec_expo/product.dart';
import 'package:flutter/material.dart';
import 'package:emec_expo/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Activities.dart';
import 'My Agenda.dart';
import 'Suporting Partners.dart';
import 'my_drawer_header.dart';
import 'Schedule.dart';
void main() => runApp(MyApp());

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
  void initState() {
    _loadData();
    super.initState();
  }
  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _data = (prefs.getString("Data") ?? '');
    print(_data);
    setState(() {
      if(_data=="1")
      {
        currentPage=DrawerSections.exhibitors;
      }
      else if(_data=="2")
        {
          currentPage=DrawerSections.congress;

        }
      else if(_data=="3")
        {
          currentPage=DrawerSections.business;

        }
      else
        {
          currentPage=DrawerSections.home;
        }
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
    else if (currentPage == DrawerSections.product) {
      container = ProductScreen();
    }
    else if (currentPage == DrawerSections.act) {
      container = ActivitesScreen();
    }
    else if (currentPage == DrawerSections.news) {
      container = NewsScreen();
    }
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
    else if (currentPage == DrawerSections.food) {
      container = FoodScreen();
    }
    else if (currentPage == DrawerSections.business) {
      container = BusinessScreen();
    }
    else if (currentPage == DrawerSections.notifications) {
      container = NotificationsScreen();
    }
    else if (currentPage == DrawerSections.settings) {
      container = SettingsScreen();
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
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "My Agenda", Icons.calendar_today,
              currentPage == DrawerSections.agenda ? true : false),
          menuItem(3, "Congress", Icons.web,
              currentPage == DrawerSections.congress ? true : false),
          menuItem(4, "Speakers", Icons.speaker_group_outlined,
              currentPage == DrawerSections.speakers ? true : false),
          //menuItem(5, "Official Events", Icons.event,
              //currentPage == DrawerSections.officialEvents ? true : false),
          menuItem(6, "Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.partners ? true : false),
          menuItem(7, "Exhibitors", Icons.work_outline,
              currentPage == DrawerSections.exhibitors ? true : false),
          menuItem(8, "Product", Icons.all_inbox,
              currentPage == DrawerSections.product ? true : false),
          menuItem(9, "Activities", Icons.local_activity_outlined,
              currentPage == DrawerSections.act ? true : false),
          menuItem(10, "News", Icons.insert_drive_file_outlined,
              currentPage == DrawerSections.news ? true : false),
          menuItem(11, "Expo Floor Plan", Icons.location_on_outlined,
              currentPage == DrawerSections.eFP ? true : false),
          menuItem(12, "Suporting Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.supportingP ? true : false),
          menuItem(13, "Media Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.mediaP ? true : false),
          menuItem(14, "Social Media", Icons.language,
              currentPage == DrawerSections.socialM ? true : false),
          menuItem(15, "Contact", Icons.contact_phone_outlined,
              currentPage == DrawerSections.contact ? true : false),
          menuItem(16, "Information", Icons.info_outline,
              currentPage == DrawerSections.information ? true : false),
          menuItem(17, "Schedule", Icons.schedule,
              currentPage == DrawerSections.schedule ? true : false),
          menuItem(18, "How to get there", Icons.map,
              currentPage == DrawerSections.getThere ? true : false),
          menuItem(19, "Food", Icons.fastfood_outlined,
              currentPage == DrawerSections.food ? true : false),
          menuItem(20, "Business Safe", Icons.health_and_safety_outlined,
              currentPage == DrawerSections.business ? true : false),
          menuItem(21, "Notifications", Icons.notifications_none,
              currentPage == DrawerSections.notifications ? true : false),
          menuItem(22, "Settings", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
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
              currentPage = DrawerSections.congress;
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
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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
  settings,
}