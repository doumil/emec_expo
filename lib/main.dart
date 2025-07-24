import 'dart:async';
import 'dart:convert'; // Added for json.decode
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Your custom imports (adjust paths as per your project structure)
import 'package:emec_expo/model/user_model.dart'; // Added: Import your User model
import 'package:emec_expo/login_screen.dart'; // Added: Import LoginScreen
import 'package:emec_expo/home_screen.dart'; // Your HomeScreen, now accepts User
import 'package:emec_expo/Busniess%20Safe.dart';
import 'package:emec_expo/Congress.dart';
import 'package:emec_expo/Contact.dart';
import 'package:emec_expo/Exhibitors.dart';
import 'package:emec_expo/Expo%20Floor%20Plan.dart'; // Renamed to EFPScreen
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
import 'package:emec_expo/details/DetailCongress.dart';
import 'package:emec_expo/details/DetailNetworkin.dart';
import 'package:emec_expo/partners.dart';
import 'package:emec_expo/product.dart'; // Your existing product screen
import 'package:emec_expo/services/local_notification_service.dart';
// import 'package:emec_expo/home_screen.dart'; // Already imported above
import 'package:emec_expo/Activities.dart';
import 'package:emec_expo/My%20Agenda.dart';
import 'package:emec_expo/Suporting%20Partners.dart'; // Your existing Supporting Partners screen
import 'package:emec_expo/details/CongressMenu.dart'; // Your existing CongressMenu screen
import 'package:emec_expo/model/notification_model.dart';
import 'package:emec_expo/my_drawer_header.dart';
import 'package:emec_expo/Schedule.dart';
import 'package:emec_expo/networking.dart';

// NEW IMPORTS FOR NEW SCREENS (Ensure these files exist in your lib folder)
import 'package:emec_expo/app_user_guide_screen.dart';
import 'package:emec_expo/my_profile_screen.dart';
import 'package:emec_expo/my_badge_screen.dart';
import 'package:emec_expo/favourites_screen.dart';
import 'package:emec_expo/scanned_badges_screen.dart';
// import 'package:emec_expo/messages_screen.dart'; // Assuming this is replaced by conversations_screen
import 'package:emec_expo/meeting_ratings_screen.dart';

import 'conversations_screen.dart'; // This seems to be your Messages screen

// Global ValueNotifier to hold the current notification count for UI updates
ValueNotifier<int> notificationCountNotifier = ValueNotifier(0);

// GLOBAL LIST FOR NOTIFICATIONS - This is the in-memory source of truth for your notifications
List<NotifClass> globalLitems = [];

// Global variables for notification details (could be local to _onMessage, but kept global as in your previous code)
var name = "1", date = "1", dtime = "1", discription = "1";
var fbm = FirebaseMessaging.instance;

// Firebase background message handler (runs in its own isolate)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage event) async {
  await Firebase.initializeApp(); // Ensure Firebase is initialized for background messages
  print("Handling a background message: ${event.messageId}");

  name = event.notification?.title ?? "No Title";
  date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
  dtime = "${DateTime.now().hour}:${DateTime.now().minute}";
  discription = event.notification?.body ?? "No Body";

  globalLitems.add(NotifClass(name, date, dtime, discription));
  print("Background notification received. Total items in globalLitems: ${globalLitems.length}");
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  HttpOverrides.global = MyHttpOverrides();

  await _requestNotificationPermission();

  await Firebase.initializeApp(); // Initialize Firebase early
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // --- LOGIN/AUTH CHECK START ---
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Check if a token exists
  final String? authToken = prefs.getString('authToken');
  User? initialUser;

  if (authToken != null && authToken.isNotEmpty) {
    // If token exists, try to load user data
    final String? userJson = prefs.getString('currentUserJson');
    if (userJson != null && userJson.isNotEmpty) {
      try {
        initialUser = User.fromJson(json.decode(userJson));
      } catch (e) {
        print("Error parsing stored user JSON in main: $e");
        // Clear corrupted data to force re-login
        await prefs.remove('authToken');
        await prefs.remove('currentUserJson');
        initialUser = null; // Force login screen if data is corrupt
      }
    }
  }

  // Determine the initial screen
  Widget initialScreen;
  if (initialUser != null && authToken != null && authToken.isNotEmpty) {
    // User is logged in, go to WelcomPage (your main shell with the drawer)
    initialScreen = WelcomPage(user: initialUser); // Pass user to WelcomPage
  } else {
    // No token or user data, go to Login Screen
    initialScreen = const LoginScreen();
  }
  // --- LOGIN/AUTH CHECK END ---


  // Initialize globalLitems with 4 items on every app start/hot reload
  globalLitems = [
    NotifClass(
      "Welcome to EMEC EXPO!",
      "01 Jan",
      "09:00",
      "Get ready for an amazing experience. Explore exhibitors and sessions.",
    ),
    NotifClass(
      "New Exhibitor Alert",
      "05 Jan",
      "10:00",
      "TechInnovate Inc. has just joined! Visit their booth at Stand 23.",
    ),
    NotifClass(
      "Upcoming Session Reminder",
      "09 Jun",
      "14:30",
      "Don't miss the 'Future of AI' panel discussion today at Hall B, Room 7. Join us live!",
    ),
    NotifClass(
      "Networking Event Tonight",
      "10 Jun",
      "18:00",
      "Join us for a casual networking reception at the Grand Ballroom.",
    ),
  ];
  notificationCountNotifier.value = globalLitems.length;

  // Existing notification badge logic
  notificationCountNotifier.addListener(() {
    int currentCount = notificationCountNotifier.value;
    if (currentCount > 0) {
      FlutterAppBadger.updateBadgeCount(currentCount);
      print("App icon badge updated to: $currentCount");
    } else {
      FlutterAppBadger.removeBadge();
      print("App icon badge removed.");
    }
  });

  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (notificationCountNotifier.value > 0) {
      FlutterAppBadger.updateBadgeCount(notificationCountNotifier.value);
    }
  });

  runApp(MyApp(initialScreen: initialScreen)); // Pass initialScreen to MyApp
}

Future<void> _requestNotificationPermission() async {
  final status = await Permission.notification.status;
  if (status.isDenied) {
    print("Notification permission denied. Requesting...");
    await Permission.notification.request();
  } else if (status.isPermanentlyDenied) {
    print("Notification permission permanently denied. Opening settings.");
    openAppSettings();
  }
}

void onMessage(){
  FirebaseMessaging.onMessage.listen((event) async {
    String? title = event.notification?.title;
    String? body = event.notification?.body;

    String current_date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    String current_dtime = "${DateTime.now().hour}:${DateTime.now().minute}";

    if (title != null && body != null) {
      globalLitems.add(NotifClass(title, current_date, current_dtime, body));
      notificationCountNotifier.value = globalLitems.length;
      print("Foreground notification received and added. Badge count: ${notificationCountNotifier.value}");
    }

    NotificationService().NotifDataChanged(title: title, body: body);
    print("FCM Foreground Notification Title: ${event.notification?.title}");
    print("FCM Foreground Notification Body: ${event.notification?.body}");
  });
}

class MyApp extends StatelessWidget {
  final Widget initialScreen; // Added: Define initialScreen parameter

  const MyApp({Key? key, required this.initialScreen}) : super(key: key); // Added: Constructor for initialScreen

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: initialScreen // Use the passed initialScreen
    );
  }
}

class WelcomPage extends StatefulWidget {
  final User? user; // Added: WelcomPage now accepts a user object

  const WelcomPage({Key? key, this.user}) : super(key: key); // Updated: Constructor to accept user

  @override
  _WelcomPageState createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  var currentPage = DrawerSections.home;
  var _data = "";
  late SharedPreferences prefs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  User? _loggedInUser; // Added: To store the current user for WelcomPage's state

  @override
  void initState() {
    super.initState();
    _initializeUserAndLoadData(); // Renamed and updated init method
    _goTo_notification_back();
    onMessage();
  }

  Future<void> _initializeUserAndLoadData() async {
    prefs = await SharedPreferences.getInstance();

    // Prioritize user passed from constructor (from main.dart if logged in)
    _loggedInUser = widget.user;

    // If user was NOT passed (e.g., this might happen if WelcomPage is navigated to without user),
    // try to load from SharedPreferences. This is a fallback now.
    if (_loggedInUser == null) {
      final String? userJsonString = prefs.getString('currentUserJson');
      if (userJsonString != null) {
        try {
          final Map<String, dynamic> userMap = json.decode(userJsonString);
          _loggedInUser = User.fromJson(userMap);
        } catch (e) {
          print("Error parsing stored user JSON in WelcomPage: $e");
          // If data is corrupt, clear token and user to force re-login
          await prefs.remove('authToken');
          await prefs.remove('currentUserJson');
          // Navigate to login if data is bad
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
            );
          });
          return; // Stop further loading if data is bad
        }
      }
    }

    // Now proceed with your existing _loadData logic using the initialized prefs
    _data = (prefs.getString("Data") ?? '');
    print("-------------Data from prefs: $_data------------------");
    setState(() {
      // Logic to set initial currentPage based on stored data
      if (_data == "1") {
        currentPage = DrawerSections.exhibitors;
      } else if (_data == "2") {
        currentPage = DrawerSections.congressmenu;
      } else if (_data == "3") {
        currentPage = DrawerSections.business;
      } else if (_data == "4") {
        currentPage = DrawerSections.notifications;
        notificationCountNotifier.value = 0;
      } else if (_data == "5") {
        currentPage = DrawerSections.congressmenu;
      } else if (_data == "6") {
        currentPage = DrawerSections.detailexhib;
      } else if (_data == "7") {
        currentPage = DrawerSections.detailcongress;
      } else if (_data == "8") {
        currentPage = DrawerSections.DetailNetworkin;
      } else if (_data == "9") {
        currentPage = DrawerSections.networking;
      } else {
        currentPage = DrawerSections.home;
      }
    });
  }


  _goTo_notification_back() {
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      prefs = await SharedPreferences.getInstance();
      prefs.setString("Data", "4");
      notificationCountNotifier.value = 0;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomPage(user: _loggedInUser,))); // Pass user to WelcomPage again
    });
  }

  int _getBottomNavIndexForBottomNav() {
    if (currentPage == DrawerSections.home) {
      return 0;
    } else if (currentPage == DrawerSections.notifications) {
      return 1;
    } else if (currentPage == DrawerSections.settings) {
      return 2;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    Widget container;
    // IMPORTANT: Pass _loggedInUser to screens that need it
    if (currentPage == DrawerSections.home) {
      container = HomeScreen(user: _loggedInUser); // Pass user here
    } else if (currentPage == DrawerSections.networking) {
      container = NetworkinScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.myAgenda) {
      container = MyAgendaScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.congress) {
      container = CongressScreen(); // Old Congress screen, check if needs User
    } else if (currentPage == DrawerSections.speakers) {
      container = SpeakersScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.officialEvents) {
      container = OfficialEventsScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.partners) {
      container = PartnersScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.exhibitors) {
      container = ExhibitorsScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.eFP) {
      container = EFPScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.supportingP) {
      container = SupportingPScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.mediaP) {
      container = MediaPScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.socialM) {
      container = SocialMScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.contact) {
      container = ContactScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.information) {
      container = InformationScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.schedule) {
      container = SchelduleScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.getThere) {
      container = GetThereScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.congressmenu) {
      container = CongressMenu(); // Check if this needs User
    }
    // else if (currentPage == DrawerSections.detailcongress) {
    //   container = DetailCongressScreen(check: false,); // Check if this needs User
    // }
    else if (currentPage == DrawerSections.DetailNetworkin) {
      container = DetailNetworkinScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.detailexhib) {
      container = ExhibitorsScreen(); // Check if this needs User
    }
    // NEW SCREEN MAPPINGS (Ensure to pass _loggedInUser if they need it)
    else if (currentPage == DrawerSections.appUserGuide) {
      container = const AppUserGuideScreen();
    } else if (currentPage == DrawerSections.myProfile) {
      // MyProfileScreen requires a non-null User object
      if (_loggedInUser != null) {
        container = MyProfileScreen(user: _loggedInUser!);
      } else {
        // Fallback or show an error if user is somehow null here
        container = const Text("User data not available for profile.");
      }
    } else if (currentPage == DrawerSections.myBadge) {
      container = const MyBadgeScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.favourites) {
      container = const FavouritesScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.scannedBadges) {
      container = const ScannedBadgesScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.messages) {
      container = const ConversationsScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.meetingRatings) {
      container = const MeetingRatingsScreen(); // Check if this needs User
    } else if (currentPage == DrawerSections.products) {
      container = ProductScreen(); // Using your existing ProductScreen, check if needs User
    } else if (currentPage == DrawerSections.congresses) {
      container = CongressScreen(); // Using your existing CongressScreen, check if needs User
    } else if (currentPage == DrawerSections.sponsors) {
      container = SupportingPScreen(); // Using your existing SupportingPScreen, check if needs User
    }
    // END NEW SCREEN MAPPINGS
    else {
      container = HomeScreen(user: _loggedInUser); // Default to HomeScreen, pass user
    }

    return Scaffold(
      key: _scaffoldKey,
      body: container,
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xff261350), // Drawer background color
            child: Column(
              children: [
                // Pass _loggedInUser to MyHeaderDrawer if it displays user info
                MyHeaderDrawer(user: _loggedInUser,), // Pass user here
                const SizedBox(height: 5.0),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ValueListenableBuilder<int>(
              valueListenable: notificationCountNotifier,
              builder: (context, count, child) {
                return badges.Badge(
                  showBadge: count > 0,
                  badgeContent: Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.red,
                    padding: EdgeInsets.all(5),
                  ),
                  position: badges.BadgePosition.topEnd(top: -10, end: -12),
                  child: const Icon(Icons.notifications),
                );
              },
            ),
            label: 'Notifications',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _getBottomNavIndexForBottomNav(),
        selectedItemColor: const Color(0xff00c1c1),
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xff261350),
        onTap: (index) async {
          setState(() {
            if (index == 0) {
              currentPage = DrawerSections.home;
            } else if (index == 1) {
              currentPage = DrawerSections.notifications;
              notificationCountNotifier.value = 0;
            } else if (index == 2) {
              _scaffoldKey.currentState?.openEndDrawer();
            }
          });
        },
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          menuItem(1, "Home", Icons.home_outlined, currentPage == DrawerSections.home),
          // Notifications is also a top-level item as per your design
          menuItem(21, "Notifications", Icons.notifications_none, currentPage == DrawerSections.notifications),

          // Event Information Section Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "EVENT INFORMATION",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          menuItem(24, "App User Guide", Icons.menu_book, currentPage == DrawerSections.appUserGuide),
          menuItem(11, "Floor Plan", Icons.location_on_outlined, currentPage == DrawerSections.eFP),
          menuItem(7, "Exhibitors", Icons.work_outline, currentPage == DrawerSections.exhibitors),
          menuItem(25, "Products", Icons.shopping_bag_outlined, currentPage == DrawerSections.products),
          menuItem(4, "Speakers", Icons.speaker_group_outlined, currentPage == DrawerSections.speakers),
          menuItem(26, "Congresses", Icons.account_balance, currentPage == DrawerSections.congresses), // Using a general icon, adjust as needed
          menuItem(27, "Sponsors", Icons.star_border, currentPage == DrawerSections.sponsors),
          menuItem(6, "Partners", Icons.handshake, currentPage == DrawerSections.partners),

          const Divider(color: Colors.white24, height: 20),

          // My Account Section Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "ACCOUNT",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          menuItem(28, "My Profile", Icons.person_outline, currentPage == DrawerSections.myProfile),
          menuItem(29, "My Badge", FontAwesomeIcons.idBadge, currentPage == DrawerSections.myBadge), // FontAwesome icon
          menuItem(30, "Favourites", Icons.favorite_border, currentPage == DrawerSections.favourites),
          menuItem(31, "Scanned Badges", Icons.qr_code_scanner, currentPage == DrawerSections.scannedBadges),
          menuItem(32, "Messages", Icons.message_outlined, currentPage == DrawerSections.messages),
          menuItem(19, "My Agenda", Icons.calendar_today, currentPage == DrawerSections.myAgenda),
          menuItem(33, "Meeting ratings", Icons.star_half, currentPage == DrawerSections.meetingRatings),
          menuItem(2, "Networking", Icons.share_rounded, currentPage == DrawerSections.networking),

          const Divider(color: Colors.white24, height: 20),

          // Other top-level items that don't fit the new categories
          menuItem(15, "Contact", Icons.contact_phone_outlined, currentPage == DrawerSections.contact),
          menuItem(18, "How to get there", Icons.map, currentPage == DrawerSections.getThere),
          menuItem(14, "Social Media", Icons.language, currentPage == DrawerSections.socialM),
          menuItem(22, "Settings", Icons.settings, currentPage == DrawerSections.settings),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.white12 : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            switch (id) {
              case 1: currentPage = DrawerSections.home; break;
              case 2: currentPage = DrawerSections.networking; break;
              case 3: currentPage = DrawerSections.congress; break;
              case 4: currentPage = DrawerSections.speakers; break;
              case 6: currentPage = DrawerSections.partners; break;
              case 7: currentPage = DrawerSections.exhibitors; break;
              case 11: currentPage = DrawerSections.eFP; break;
              case 12: currentPage = DrawerSections.supportingP; break;
              case 14: currentPage = DrawerSections.socialM; break;
              case 15: currentPage = DrawerSections.contact; break;
              case 18: currentPage = DrawerSections.getThere; break;
              case 19: currentPage = DrawerSections.myAgenda; break;
              case 21: currentPage = DrawerSections.notifications; notificationCountNotifier.value = 0; break;
              case 22: currentPage = DrawerSections.settings; break;

            // NEW NAVIGATION CASES
              case 24: currentPage = DrawerSections.appUserGuide; break;
              case 25: currentPage = DrawerSections.products; break;
              case 26: currentPage = DrawerSections.congresses; break;
              case 27: currentPage = DrawerSections.sponsors; break;
              case 28: currentPage = DrawerSections.myProfile; break;
              case 29: currentPage = DrawerSections.myBadge; break;
              case 30: currentPage = DrawerSections.favourites; break;
              case 31: currentPage = DrawerSections.scannedBadges; break;
              case 32: currentPage = DrawerSections.messages; break;
              case 33: currentPage = DrawerSections.meetingRatings; break;

            // Fallback for existing specific detail pages if they are still entry points
              case 5: currentPage = DrawerSections.officialEvents; break;
              case 8: currentPage = DrawerSections.product; break;
              case 9: currentPage = DrawerSections.act; break;
              case 10: currentPage = DrawerSections.news; break;
              case 13: currentPage = DrawerSections.mediaP; break;
              case 16: currentPage = DrawerSections.information; break;
              case 17: currentPage = DrawerSections.schedule; break;
              case 20: currentPage = DrawerSections.business; break;
              case 23: currentPage = DrawerSections.myAgenda; break;
              case 3: currentPage = DrawerSections.congressmenu; break;
              case 7: currentPage = DrawerSections.detailexhib; break;
              case 7: currentPage = DrawerSections.detailcongress; break;
              case 8: currentPage = DrawerSections.DetailNetworkin; break;

              default: currentPage = DrawerSections.home;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: const Color(0xff00c1c1),
              ),
              const SizedBox(width: 16),
              Expanded( // Use Expanded to prevent overflow if text is long
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
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
  myAgenda,
  networking,
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
  detailcongress,
  DetailNetworkin,

  // NEW SECTIONS FROM DESIGN
  appUserGuide,
  myProfile,
  myBadge,
  favourites,
  scannedBadges,
  messages,
  meetingRatings,
  products,
  congresses,
  sponsors,
}