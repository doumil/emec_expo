import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/details/DetailExhibitors.dart';
import 'package:emec_expo/details/ExhibitorsMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'main.dart'; // Uncomment if 'main.dart' is needed for navigation or other global states
import 'package:emec_expo/model/exhibitors_model.dart'; // <--- CRUCIAL IMPORT for ExhibitorsClass
import 'package:http/http.dart' as http; // Although not used in this snippet, keeping if from previous context

class ExhibitorsScreen extends StatefulWidget {
  const ExhibitorsScreen({Key? key}) : super(key: key);

  @override
  _ExhibitorsScreenState createState() => _ExhibitorsScreenState();
}

class _ExhibitorsScreenState extends State<ExhibitorsScreen> {
  late SharedPreferences prefs;
  List<ExhibitorsClass> _allExhibitors = []; // Original list of all exhibitors
  List<ExhibitorsClass> _recommendedExhibitors = []; // List of recommended exhibitors
  List<ExhibitorsClass> _otherExhibitors = []; // List of non-recommended exhibitors
  List<ExhibitorsClass> _filteredOtherExhibitors = []; // List shown in the main vertical list (filtered by search/favorites)

  bool isLoading = true;
  TextEditingController _searchController = TextEditingController();
  bool _isStarFilterActive = false; // To toggle display of only favorited exhibitors

  @override
  void initState() {
    super.initState();
    _loadData();
    _searchController.addListener(_filterExhibitors);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _loadData() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // IMPORTANT: Make sure the order of constructor parameters matches your ExhibitorsClass definition.
    // ExhibitorsClass(id, title, stand, shortDiscriptions, adress, discriptions, siteweb, image, fav, star, {isRecommended})

    _allExhibitors.add(ExhibitorsClass(
        0,
        'TECHNOPARK',
        'ED240',
        'Incubateur technologique',
        'Casablanca, Morocco',
        'Full description for Technopark',
        'www.technopark.ma',
        'assets/partners/1.png', // Image path (String)
        false, // fav (bool)
        true, // star (bool)
        isRecommended: true)); // named parameter

    _allExhibitors.add(ExhibitorsClass(
        1,
        'AMMC',
        'EF300',
        'Autorité des marchés financiers',
        'Rabat, Morocco',
        'Full description for AMMC',
        'www.ammc.ma',
        'assets/partners/2.png', // Image path (String)
        false, // fav (bool)
        false, // star (bool)
        isRecommended: true));

    _allExhibitors.add(ExhibitorsClass(
        2,
        'MEDI 1 RADIO',
        'RZ901',
        'Radio d\'information continue',
        'Tanger, Morocco',
        'Full description for Medi 1 Radio',
        'www.medi1radio.com',
        'assets/partners/3.png', // Image path (String)
        false, // fav (bool)
        false, // star (bool)
        isRecommended: true));

    _allExhibitors.add(ExhibitorsClass(
        3,
        'buzz event',
        'FG450',
        'Solutions IT innovantes',
        'casablanca, Morocco',
        'Full description for ABC Solutions',
        'www.abcsolutions.ma',
        'assets/partners/4.png', // Image path (String)
        false, // fav (bool)
        false, // star (bool)
        isRecommended: true));

    // *** THESE ARE THE LINES THAT WERE LIKELY CAUSING THE ERROR ***
    // I've added distinct placeholder image paths to ensure they are Strings.
    // Replace 'assets/partners/placeholder_X.png' with your actual image paths.

    _allExhibitors.add(ExhibitorsClass(
        4,
        'Quantum Tech',
        'XY100',
        'Expert en cybersécurité',
        'Marrakech, Morocco',
        'Full description for Quantum Tech',
        'www.quantumtech.ma',
        'assets/partners/5.png', // Image path (String) - Changed from placeholder for consistency
        false, // fav (bool)
        true // star (bool)
    )); // isRecommended defaults to false

    _allExhibitors.add(ExhibitorsClass(
        5,
        'ZETA Corp',
        'AB200',
        'Développement de logiciels',
        'Agadir, Morocco',
        'Full description for Zeta Corp',
        'www.zetacorp.ma',
        'assets/partners/6.png', // Image path (String)
        false, // fav (bool)
        false // star (bool)
    ));

    _allExhibitors.add(ExhibitorsClass(
        6,
        'Innovate Hub',
        'CD301',
        'Espace de co-working',
        'Rabat, Morocco',
        'Full description for Innovate Hub',
        'www.innovatehub.ma',
        'assets/partners/7.png', // Image path (String)
        false, // fav (bool)
        false // star (bool)
    ));

    _allExhibitors.add(ExhibitorsClass(
        7,
        'Global Connect',
        'EF400',
        'Fournisseur de services internet',
        'Casablanca, Morocco',
        'Full description for Global Connect',
        'www.globalconnect.ma',
        'assets/partners/8.png', // Image path (String)
        false, // fav (bool)
        false // star (bool)
    ));

    _allExhibitors.add(ExhibitorsClass(
        8,
        'inytom',
        'GH500',
        'Agence de marketing digital',
        'casablanca, Morocco',
        'Full description for Digital Dreams',
        'www.digitaldreams.ma',
        'assets/partners/9.png', // Image path (String)
        false, // fav (bool)
        false // star (bool)
    ));

    _allExhibitors.add(ExhibitorsClass(
        9,
        'Eco Ventures',
        'IJ600',
        'Solutions écologiques',
        'Fes, Morocco',
        'Full description for Eco Ventures',
        'www.ecoventures.ma',
        'assets/partners/10.png', // Image path (String)
        false, // fav (bool)
        false // star (bool)
    ));

    _allExhibitors.add(ExhibitorsClass(
        10,
        'Future Systems',
        'KL700',
        'Intégrateur de systèmes',
        'Marrakech, Morocco',
        'Full description for Future Systems',
        'www.futuresystems.ma',
        'assets/partners/11.png', // Image path (String)
        false, // fav (bool)
        false // star (bool)
    ));

    _allExhibitors.add(ExhibitorsClass(
        11,
        'Green Energy Co',
        'MN800',
        'Énergies renouvelables',
        'Agadir, Morocco',
        'Full description for Green Energy Co',
        'www.greenenergy.ma',
        'assets/partners/12.png', // Image path (String)
        false, // fav (bool)
        false // star (bool)
    ));

    _allExhibitors.add(ExhibitorsClass(
        12,
        'Bright Minds',
        'OP900',
        'Formations professionnelles',
        'Casablanca, Morocco',
        'Full description for Bright Minds',
        'www.brightminds.ma', // Added a website as well
        'assets/partners/13.png', // Image path (String)
        false, // fav (bool)
        false // star (bool)
    ));


    // Filter into recommended and other exhibitors
    _recommendedExhibitors = _allExhibitors.where((exh) => exh.isRecommended).toList();
    _otherExhibitors = _allExhibitors.where((exh) => !exh.isRecommended).toList();

    // Sort other exhibitors by title for alphabetical grouping
    _otherExhibitors.sort((a, b) => a.title.compareTo(b.title));

    setState(() {
      _filteredOtherExhibitors = _otherExhibitors; // Initialize filtered list
      isLoading = false;
    });
  }

  void _filterExhibitors() {
    String query = _searchController.text.toLowerCase();
    List<ExhibitorsClass> currentSourceList = _otherExhibitors; // Always filter the non-recommended list

    List<ExhibitorsClass> searchResults = currentSourceList.where((exhibitor) {
      final title = exhibitor.title.toLowerCase();
      final stand = exhibitor.stand.toLowerCase();
      final adress = exhibitor.adress.toLowerCase(); // Include adress in search
      final shortDescription = exhibitor.shortDiscriptions.toLowerCase(); // Include short description in search
      return title.contains(query) || stand.contains(query) || adress.contains(query) || shortDescription.contains(query);
    }).toList();

    // Apply favorite filter if active
    if (_isStarFilterActive) {
      searchResults = searchResults.where((exhibitor) => exhibitor.star).toList();
    }

    setState(() {
      _filteredOtherExhibitors = searchResults;
      if (searchResults.isEmpty && query.isNotEmpty) {
        Fluttertoast.showToast(msg: "Search not found...!", toastLength: Toast.LENGTH_SHORT);
      } else if (searchResults.isEmpty && _isStarFilterActive && query.isEmpty) {
        Fluttertoast.showToast(msg: "No favorited exhibitors to show...!", toastLength: Toast.LENGTH_SHORT);
      }
    });
  }

  void _toggleStarFilter() {
    setState(() {
      _isStarFilterActive = !_isStarFilterActive;
      _filterExhibitors(); // Re-apply filters based on new state
    });
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

    // Group non-recommended exhibitors by first letter of title
    Map<String, List<ExhibitorsClass>> groupedOtherExhibitors = {};
    for (var exhibitor in _filteredOtherExhibitors) {
      String firstLetter = exhibitor.title.isNotEmpty ? exhibitor.title[0].toUpperCase() : '#';
      if (!groupedOtherExhibitors.containsKey(firstLetter)) {
        groupedOtherExhibitors[firstLetter] = [];
      }
      groupedOtherExhibitors[firstLetter]!.add(exhibitor);
    }
    // Sort keys alphabetically
    List<String> sortedKeys = groupedOtherExhibitors.keys.toList()..sort();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white, // Overall white background
          appBar: AppBar(
            backgroundColor: Color(0xFF261350), // Dark blue background, as per image
            elevation: 0, // No shadow
            title: Text(
              'Exhibitors', // Title
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.filter_list, color: Colors.white), // Filter icon
                onPressed: () {
                  // Handle other filters if needed
                },
              ),
              IconButton(
                icon: Icon(
                  _isStarFilterActive ? Icons.star : Icons.star_border, // Star icon for favorite filter
                  color: _isStarFilterActive ? Color(0xff00c1c1) : Colors.white, // Color based on active state
                ),
                onPressed: _toggleStarFilter, // Toggle favorite filter
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.08), // Height for search bar
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2), // Slightly transparent white
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Recherche', // Hint text
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                      prefixIcon: Icon(Icons.search, color: Colors.white), // Search icon
                      border: InputBorder.none, // No border
                      contentPadding: EdgeInsets.symmetric(vertical: height * 0.015),
                    ),
                    style: TextStyle(fontSize: height * 0.02, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          body: isLoading
              ? Center(
            child: SpinKitThreeBounce(
              color: Color(0xff00c1c1),
              size: 30.0,
            ),
          )
              : FadeInDown(
            duration: Duration(milliseconds: 500),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recommended Exhibitors Section
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.04, height * 0.02, width * 0.04, height * 0.01),
                    child: Text(
                      'Sponsors', // "Sponsors" label
                      style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.22, // Adjusted height for recommended cards
                    child: _recommendedExhibitors.isEmpty
                        ? Center(
                      child: Text("No recommended exhibitors found.", style: TextStyle(color: Colors.grey)),
                    )
                        : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      itemCount: _recommendedExhibitors.length,
                      itemBuilder: (context, index) {
                        return _buildRecommendedExhibitorCard(_recommendedExhibitors[index], width, height);
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  // Alphabetically Grouped Exhibitors Section
                  if (_filteredOtherExhibitors.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          _searchController.text.isNotEmpty
                              ? "No exhibitors found for your search."
                              : (_isStarFilterActive ? "No favorited exhibitors to display." : "No exhibitors to display."),
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  else
                    ...sortedKeys.map((letter) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(width * 0.04, height * 0.02, width * 0.04, height * 0.01),
                            child: Text(
                              letter, // Alphabetical section header
                              style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                            itemCount: groupedOtherExhibitors[letter]!.length,
                            itemBuilder: (context, index) {
                              return _buildExhibitorListItem(groupedOtherExhibitors[letter]![index], width, height);
                            },
                          ),
                        ],
                      );
                    }).toList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget for Recommended Exhibitor Cards (horizontal scroll)
  Widget _buildRecommendedExhibitorCard(ExhibitorsClass exhibitor, double width, double height) {
    return Container(
      width: width * 0.45, // Width of each card
      margin: EdgeInsets.only(right: width * 0.03), // Spacing between cards
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        border: Border.all(color: Colors.yellow.shade700, width: 2), // Yellow border for recommended
      ),
      child: GestureDetector(
        onTap: () async {
          prefs = await SharedPreferences.getInstance();
          prefs.setString("Data", exhibitor.id.toString()); // Store exhibitor ID for detail screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailExhibitorsScreen()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              Stack (
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    exhibitor.image,
                    width: width * 0.25, // Adjust size as needed for logos
                    height: width * 0.15,
                    fit: BoxFit.contain, // Use contain for logos
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback image if the original asset is not found
                      return Image.asset(
                        'assets/placeholder_error.png', // A generic error image
                        width: width * 0.25,
                        height: width * 0.15,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                  Positioned( // Use Positioned for better control of the star icon
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        exhibitor.star ? Icons.star : Icons.star_border, // Filled or outlined star
                        color: exhibitor.star ? Color(0xff00c1c1) : Colors.grey, // Color based on favorite status
                        size: width * 0.05,
                      ),
                      onPressed: () {
                        setState(() {
                          exhibitor.star = !exhibitor.star; // Toggle favorite status
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Text(
                exhibitor.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2.0),
              // Display adress if available, otherwise short description
              Text(
                exhibitor.adress.isNotEmpty ? exhibitor.adress : exhibitor.shortDiscriptions,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height * 0.014,
                  color: Colors.grey[700],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Exhibitor List Items (vertical list)
  Widget _buildExhibitorListItem(ExhibitorsClass exhibitor, double width, double height) {
    return InkWell(
      onTap: () async {
        prefs = await SharedPreferences.getInstance();
        prefs.setString("Data", exhibitor.id.toString()); // Store exhibitor ID for detail screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailExhibitorsScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.015),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1.0)), // Divider line
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Company Logo (Circular image)
            ClipOval(
              child: Image.asset(
                exhibitor.image,
                width: width * 0.12, // Size of circular image
                height: width * 0.12,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback image if the original asset is not found
                  return Image.asset(
                    'assets/placeholder_error.png', // A generic error image
                    width: width * 0.12,
                    height: width * 0.12,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(width: width * 0.04), // Spacing

            // Title, Location (adress), and Stand
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exhibitor.title,
                    style: TextStyle(
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0),
                  // Display adress if available, otherwise short description
                  Text(
                    exhibitor.adress.isNotEmpty ? exhibitor.adress : exhibitor.shortDiscriptions,
                    style: TextStyle(
                      fontSize: height * 0.016,
                      color: Colors.grey[700],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    "Stand :${exhibitor.stand}", // Stand number
                    style: TextStyle(color: Colors.black26, height: 1.5, fontSize: height * 0.014),
                  ),
                ],
              ),
            ),

            // Star Icon
            IconButton(
              icon: Icon(
                exhibitor.star ? Icons.star : Icons.star_border, // Filled or outlined star
                color: exhibitor.star ? Color(0xff00c1c1) : Colors.grey, // Color based on favorite status
                size: width * 0.06,
              ),
              onPressed: () {
                setState(() {
                  exhibitor.star = !exhibitor.star; // Toggle favorite status
                  _filterExhibitors(); // Re-apply filters to update the list if favorite filter is active
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy DetailExhibitorsScreen (make sure this is in details/DetailExhibitors.dart)
// This is a placeholder for your actual detail screen.
class DetailExhibitorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exhibitor Details'),
      ),
      body: Center(
        child: Text('Details about the exhibitor.'),
      ),
    );
  }
}