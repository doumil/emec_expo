import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/model/notification_model.dart';
import 'package:emec_expo/services/local_notification_service.dart';
import 'package:emec_expo/services/onwillpop_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Busniess Safe.dart';
import 'Notifications.dart';
import 'database_helper/database_helper.dart';
import 'main.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var db = new DataBaseHelperNotif();
  String name = "1", date = "1", dtime = "1", discription = "1";
  var fbm = FirebaseMessaging.instance;
  late SharedPreferences prefs;

  @override
  void initState() {
    _loadData();
    fbm.getToken().then((token) {
      print("----------- token ------------");
      print(token);
      print("------------------------------------------------");
    });
    super.initState();
  }

  _loadData() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("Data", "0");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    OnWillPop on = OnWillPop();
    return WillPopScope(
      onWillPop: on.onWillPop1,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Home")),
          backgroundColor: Colors.black,
          actions: const <Widget>[],
          elevation: 0,
          //leading: const SizedBox.shrink(),
        ),
        body: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText2!,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              /*Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                color: Colors.black,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 11,
                                      child: Container(
                                        margin: EdgeInsets.only(left: width * 0.035),
                                        width: width * 0.47,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: height * 0.03,
                                              margin: EdgeInsets.only(bottom: height * 0.01),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(right: 5),
                                                    child: Icon(
                                                      Icons.event_note,
                                                      size: height * 0.02,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      width: width * 0.4,
                                                      child: Text(
                                                        "11-13 Sept 2024",
                                                        style: TextStyle(
                                                          fontSize: height * 0.018,
                                                          fontWeight: FontWeight.w300,
                                                          color: Colors.white,
                                                        ),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.06,
                                      width: 0.7,
                                      color: const Color(0xff00c1c1),
                                    ),
                                    Expanded(
                                      flex: 11,
                                      child: Container(
                                        margin: EdgeInsets.only(left: width * 0.035),
                                        width: width * 0.47,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: height * 0.03,
                                              margin: EdgeInsets.only(bottom: height * 0.01),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(right: 5),
                                                    child: Icon(
                                                      Icons.location_on,
                                                      size: height * 0.02,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      width: width * 0.4,
                                                      child: Text(
                                                        "International Fair - OFEC Morocco",
                                                        style: TextStyle(
                                                          fontSize: height * 0.018,
                                                          fontWeight: FontWeight.w300,
                                                          color: Colors.white,
                                                        ),
                                                        overflow: TextOverflow.visible,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: FadeInDown(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black,
                                      Color(0xff261350),
                                    ],
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04, vertical: height * 0.02),
                                child: Column( // Main Column for content below banner
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          width * 0.04,
                                          width * 0.04,
                                          width * 0.04,
                                          width * 0.01),
                                      child: Image.asset(
                                        "assets/banner.png",
                                      ),
                                    ),
                                    SizedBox(height: height * 0.02), // Spacing after banner

                                    // Custom Row for "My Badge" and the first two cards
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align top
                                      children: [
                                        // My Badge Card (takes up full left column space)
                                        Expanded(
                                          flex: 3, // Increased flex for My Badge
                                          child: SizedBox(
                                            height: height * 0.28, // Approximate height for My Badge to span two rows
                                            child: _buildMyBadgeCard(
                                              context: context,
                                              title: 'My Badge',
                                              icon: Icons.qr_code_scanner,
                                              dataValue: '1',
                                              width: width,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: width * 0.099), // Spacing between columns
                                        // Column for Floor Plan and Networking
                                        Expanded(
                                          flex: 2, // Reduced flex for this column
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * 0.13, // Height for regular cards
                                                child: _buildGridCard(
                                                  context: context,
                                                  title: 'Floor Plan',
                                                  icon: Icons.location_on_outlined,
                                                  dataValue: '1',
                                                  width: width,
                                                ),
                                              ),
                                              SizedBox(height: height * 0.018), // Spacing between cards
                                              SizedBox(
                                                height: height * 0.13, // Height for regular cards
                                                child: _buildGridCard(
                                                  context: context,
                                                  title: 'Networking',
                                                  icon: Icons.people_outline,
                                                  dataValue: '2',
                                                  width: width,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.025), // Spacing between this row and the grid below

                                    // Remaining cards in a GridView
                                    GridView.count(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.1,
                                      crossAxisSpacing: width * 0.04,
                                      mainAxisSpacing: height * 0.025,
                                      children: <Widget>[
                                        _buildGridCard(
                                          context: context,
                                          title: 'Exhibitors',
                                          icon: Icons.store_mall_directory_outlined,
                                          dataValue: '1',
                                          width: width,
                                        ),
                                        _buildGridCard(
                                          context: context,
                                          title: 'Products',
                                          icon: Icons.category_outlined,
                                          dataValue: '2',
                                          width: width,
                                        ),
                                        _buildGridCard(
                                          context: context,
                                          title: 'Conferences',
                                          icon: Icons.speaker_notes_outlined,
                                          dataValue: '1',
                                          width: width,
                                        ),
                                        _buildGridCard(
                                          context: context,
                                          title: 'My Agenda',
                                          icon: Icons.calendar_today_outlined,
                                          dataValue: '2',
                                          width: width,
                                        ),
                                        _buildGridCard(
                                          context: context,
                                          title: 'Institutional\nPartners',
                                          icon: Icons.handshake_outlined,
                                          dataValue: '1',
                                          width: width,
                                        ),
                                        _buildGridCard(
                                          context: context,
                                          title: 'Sponsors',
                                          icon: Icons.favorite_outline,
                                          dataValue: '2',
                                          width: width,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // New function specifically for "My Badge" card
  Widget _buildMyBadgeCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String dataValue,
    required double width,
  }) {
    return GestureDetector(
      onTap: () async {
        prefs = await SharedPreferences.getInstance();
        prefs.setString("Data", dataValue);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        // Adjusted padding to create more space around content and align left
        padding: EdgeInsets.only(left: width * 0.05, top: width * 0.05, bottom: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.start, // Align to start (left)
          children: <Widget>[
            Icon(
              icon,
              size: 60, // Significantly larger icon
              color: Color(0xff00c1c1),
            ),
            SizedBox(height: 12.0), // More space between icon and text
            Text(
              title,
              textAlign: TextAlign.left, // Left align text
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0, // Larger font size for "My Badge"
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }


  // General function for other grid cards
  Widget _buildGridCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String dataValue,
    required double width,
    // height is not directly used here for internal card sizing,
    // but the SizedBox wrapping it in the build method handles the height
  }) {
    return GestureDetector(
      onTap: () async {
        prefs = await SharedPreferences.getInstance();
        prefs.setString("Data", dataValue);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomPage()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        padding: EdgeInsets.all(width * 0.03), // Overall padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Keep centered for other cards
          children: <Widget>[
            Icon(
              icon,
              size: 40,
              color: Color(0xff00c1c1),
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Ensure WelcomPage and other required classes are defined in your project
class WelcomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Text('Welcome to the next page!'),
      ),
    );
  }
}