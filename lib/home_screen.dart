import 'dart:convert';
import 'package:animate_do/animate_do.dart';
// import 'package:emec_expo/model/notification_model.dart'; // Keep if used for local notifications
// import 'package:emec_expo/services/local_notification_service.dart'; // Keep if used for local notifications
import 'package:emec_expo/services/onwillpop_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart'; // Consolidated material and cupertino
// import 'package:flutter/cupertino.dart'; // Not strictly needed if using Material widgets
// import 'package:flutter/services.dart'; // Keep if SystemUiOverlayStyle is used elsewhere
// Removed unused carousel slider imports
// import 'package:flutter_carousel_slider/carousel_slider.dart';
// import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
// import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Consider renaming Busniess Safe.dart to Business_Safe.dart for consistency and typo fix
// import 'Busniess Safe.dart'; // Removed as not used in this snippet
// import 'Notifications.dart'; // Removed as not used in this snippet

import 'database_helper/database_helper.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_screen.dart';
import 'model/user_model.dart';

class HomeScreen extends StatefulWidget {
  final User? user;

  const HomeScreen({Key? key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _loggedInUser;
  String? _authToken;

  final DataBaseHelperNotif db = DataBaseHelperNotif(); // Use final for non-changing instances
  final FirebaseMessaging fbm = FirebaseMessaging.instance; // Use final
  late SharedPreferences prefs; // prefs will be initialized in initState

  @override
  void initState() {
    super.initState();
    _initializeUserAndToken();
    fbm.getToken().then((token) {
      if (token != null) { // Check if token is not null
        print("----------- Firebase Token ------------");
        print(token);
        print("---------------------------------------");
      }
    });
  }

  // Method to handle loading user data and token
  _initializeUserAndToken() async {
    prefs = await SharedPreferences.getInstance(); // Initialize prefs here

    // Use widget.user if provided, otherwise try loading from SharedPreferences
    User? userFromWidget = widget.user;
    User? userFromPrefs;

    final String? userJsonString = prefs.getString('currentUserJson');
    if (userJsonString != null) {
      try {
        final Map<String, dynamic> userMap = json.decode(userJsonString);
        userFromPrefs = User.fromJson(userMap);
      } catch (e) {
        print("Error parsing stored user JSON: $e");
        // Optionally clear corrupted data: await prefs.remove('currentUserJson');
      }
    }

    setState(() {
      // Prioritize user from widget (passed from login)
      // If not available, use user from prefs
      // If neither, fallback to a basic Guest user
      _loggedInUser = userFromWidget ?? userFromPrefs ?? User(
        id: 0,
        name: "Guest",
        nom: "User",
        prenom: "",
        email: "guest@example.com",
      );
      _authToken = prefs.getString('authToken');
    });

    // Consider if this `Data` setting is still necessary or should be elsewhere
    prefs.setString("Data", "0");
  }

  Future<void> _logout() async {
    await prefs.remove('authToken');
    await prefs.remove('currentUserJson');

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false,
    );
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
          title:  Center(child:  Text(
            'Welcome, ${_loggedInUser?.name ?? 'Guest'}!',
            style: const TextStyle( // Added const
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),), // Added const
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: _logout,
              tooltip: 'Logout',
            ),
          ],
          elevation: 0,
        ),
        body: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!, // bodyText2 is deprecated, use bodyMedium
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return Container(
                // Use a Column here instead of ConstrainedBox for simpler layout flow
                // if the IntrinsicHeight isn't strictly necessary for a dynamic height parent.
                // However, if it prevents scroll issues with a fixed parent height, keep it.
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        // Consider if this Container is still needed or can be removed
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: const <Widget>[ // Added const
                              // Existing UI for event date/location
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: FadeInDown(
                              duration: const Duration(milliseconds: 500), // Added const
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
                                child: Column(
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
                                    SizedBox(height: height * 0.02),

                                    // Custom Row for "My Badge" and the first two cards
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // My Badge Card
                                        Expanded(
                                          flex: 3,
                                          child: SizedBox(
                                            height: height * 0.28,
                                            child: _buildMyBadgeCard(
                                              context: context,
                                              title: 'My Badge',
                                              icon: Icons.qr_code_scanner,
                                              dataValue: '1',
                                              width: width,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: width * 0.099),
                                        // Column for Floor Plan and Networking
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: height * 0.13,
                                                child: _buildGridCard(
                                                  context: context,
                                                  title: 'Floor Plan',
                                                  icon: Icons.location_on_outlined,
                                                  dataValue: '1',
                                                  width: width,
                                                ),
                                              ),
                                              SizedBox(height: height * 0.018),
                                              SizedBox(
                                                height: height * 0.13,
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
                                    SizedBox(height: height * 0.025),

                                    // Remaining cards in a GridView
                                    GridView.count(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(), // Added const
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
      onTap: () {
        // No need to await SharedPreferences.getInstance() here again,
        // as 'prefs' is already initialized in initState.
        prefs.setString("Data", dataValue); // Consider a more specific key
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
        padding: EdgeInsets.only(left: width * 0.05, top: width * 0.05, bottom: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              size: 60,
              color: const Color(0xff00c1c1), // Added const
            ),
            const SizedBox(height: 12.0), // Added const
            Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle( // Added const
                color: Colors.white,
                fontSize: 22.0,
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
  }) {
    return GestureDetector(
      onTap: () {
        // No need to await SharedPreferences.getInstance() here again.
        prefs.setString("Data", dataValue); // Consider a more specific key
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
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 40,
              color: const Color(0xff00c1c1), // Added const
            ),
            const SizedBox(height: 8.0), // Added const
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle( // Added const
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
// This is a placeholder; you'll likely want different screens based on card taps.
class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key}); // Added const constructor and super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'), // Added const
      ),
      body: const Center( // Added const
        child: Text('Welcome to the next page!'),
      ),
    );
  }
}