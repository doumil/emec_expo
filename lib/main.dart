import 'package:emec_expo/Congress.dart';
import 'package:emec_expo/Exhibitors.dart';
import 'package:emec_expo/Expo%20Floor%20Plan.dart';
import 'package:emec_expo/Media%20Partners.dart';
import 'package:emec_expo/News.dart';
import 'package:emec_expo/Official%20events.dart';
import 'package:emec_expo/Speakers.dart';
import 'package:emec_expo/partners.dart';
import 'package:emec_expo/product.dart';
import 'package:flutter/material.dart';
import 'package:emec_expo/home_screen.dart';
import 'Activities.dart';
import 'My Agenda.dart';
import 'Suporting Partners.dart';
import 'my_drawer_header.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomPage(),
    );
  }
}
class WelcomPage extends StatefulWidget {
  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  var currentPage = DrawerSections.Home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.Home) {
      container = HomeScreen();
    }
    else if (currentPage == DrawerSections.Agenda) {
      container = MyAgendaScreen();
    }
    else if (currentPage == DrawerSections.Congress) {
      container = CongressScreen();
    }
    else if (currentPage == DrawerSections.Speakers) {
      container = SpeakersScreen();
    }
    else if (currentPage == DrawerSections.OfficialEvents) {
      container = OfficialEventsScreen();
    }
    else if (currentPage == DrawerSections.Partners) {
      container = PartnersScreen();
    }
    else if (currentPage == DrawerSections.Exhibitors) {
      container = ExhibitorsScreen();
    }
    else if (currentPage == DrawerSections.Product) {
      container = ProductScreen();
    }
    else if (currentPage == DrawerSections.Activites) {
      container = ActivitesScreen();
    }
    else if (currentPage == DrawerSections.News) {
      container = NewsScreen();
    }
    else if (currentPage == DrawerSections.EFP) {
      container = EFPScreen();
    }
    else if (currentPage == DrawerSections.SupportingP) {
      container = SupportingPScreen();
    }
    else if (currentPage == DrawerSections.MediaP) {
      container = MediaPScreen();
    }
    return Scaffold(
      appBar: AppBar(
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
              currentPage == DrawerSections.Home ? true : false),
          menuItem(2, "My Agenda", Icons.calendar_today,
              currentPage == DrawerSections.Agenda ? true : false),
          menuItem(3, "Congress", Icons.web,
              currentPage == DrawerSections.Congress ? true : false),
          menuItem(4, "Speakers", Icons.speaker_group_outlined,
              currentPage == DrawerSections.Speakers ? true : false),
          menuItem(5, "Official Events", Icons.event,
              currentPage == DrawerSections.OfficialEvents ? true : false),
          menuItem(6, "Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.Partners ? true : false),
          menuItem(7, "Exhibitors", Icons.work_outline,
              currentPage == DrawerSections.Exhibitors ? true : false),
          menuItem(8, "Product", Icons.all_inbox,
              currentPage == DrawerSections.Product ? true : false),
          menuItem(9, "Activities", Icons.local_activity_outlined,
              currentPage == DrawerSections.Activites ? true : false),
          menuItem(10, "News", Icons.insert_drive_file_outlined,
              currentPage == DrawerSections.News ? true : false),
          menuItem(11, "Expo Floor Plan", Icons.location_on_outlined,
              currentPage == DrawerSections.EFP ? true : false),
          menuItem(12, "Suporting Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.SupportingP ? true : false),
          menuItem(13, "Media Partners", Icons.account_tree_outlined,
              currentPage == DrawerSections.MediaP ? true : false),
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
              currentPage = DrawerSections.Home;
            }else if (id == 2) {
              currentPage = DrawerSections.Agenda;
            }
            else if (id == 3) {
              currentPage = DrawerSections.Congress;
            }
            else if (id == 4) {
              currentPage = DrawerSections.Speakers;
            }
            else if (id == 5) {
              currentPage = DrawerSections.OfficialEvents;
            }
            else if (id == 6) {
              currentPage = DrawerSections.Partners;
            }
            else if (id == 7) {
              currentPage = DrawerSections.Exhibitors;
            }
            else if (id == 8) {
              currentPage = DrawerSections.Product;
            }
            else if (id == 9) {
              currentPage = DrawerSections.Activites;
            }
            else if (id == 10) {
              currentPage = DrawerSections.News;
            }
            else if (id == 11) {
              currentPage = DrawerSections.EFP;
            }
            else if (id == 12) {
              currentPage = DrawerSections.SupportingP;
            }
            else if (id == 13) {
              currentPage = DrawerSections.MediaP;
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
  Home,
  Agenda,
  Congress,
  Speakers,
  OfficialEvents,
  Partners,
  Exhibitors,
  Product,
  Activites,
  News,
  EFP,
  SupportingP,
  MediaP,
}