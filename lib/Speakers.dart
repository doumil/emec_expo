import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast
import 'details/DetailSpeakeres.dart'; // Ensure this path is correct
import 'model/speakers_model.dart'; // Ensure this path is correct
import 'package:http/http.dart' as http; // Make sure http is imported

class SpeakersScreen extends StatefulWidget {
  const SpeakersScreen({Key? key}) : super(key: key);

  @override
  _SpeakersScreenState createState() => _SpeakersScreenState();
}

class _SpeakersScreenState extends State<SpeakersScreen> {
  List<Speakers> _allSpeakers = []; // Original list of all speakers
  List<Speakers> _recommendedSpeakers = []; // List of recommended speakers
  List<Speakers> _otherSpeakers = []; // List of non-recommended speakers
  List<Speakers> _filteredOtherSpeakers = []; // List shown in the main vertical list (filtered by search/favorites)

  bool isLoading = true;
  TextEditingController _searchController = TextEditingController();
  bool _isFavoriteFilterActive = false; // To toggle display of only favorited speakers

  @override
  void initState() {
    super.initState();
    _loadData();
    _searchController.addListener(_filterSpeakers);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _loadData() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // Your existing speaker data with isRecommended and isFavorite flag
    _allSpeakers.add(Speakers("Hassan", "EL OUARDY", "", "Co-Founder of Shipsen", "assets/speakers/speakers2024/1.jpeg", isRecommended: true, isFavorite: false));
    _allSpeakers.add(Speakers("Reda", "AOUNI", "", "Co-Founder of Shipsen", "assets/speakers/speakers2024/2.png", isRecommended: true, isFavorite: true)); // Example of a favorited recommended speaker
    _allSpeakers.add(Speakers("Abderrahmane ", "HASSANI IDRISSI", "", "CEO Shopyan, Directeur de Projet & Programme Neoxecutive", "assets/speakers/speakers2024/3.png", isRecommended: true, isFavorite: false));
    _allSpeakers.add(Speakers("Yassine", "ZAIM", "", "Ingenieur informatique , Paiement en ligne Expert E-commerce", "assets/speakers/speakers2024/4.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Abderrazak", "YOUSFI", "", "CEO of Media Digital Invest", "assets/speakers/speakers2024/5.png", isRecommended: false, isFavorite: true)); // Example of a favorited regular speaker
    _allSpeakers.add(Speakers("Mohammed", "TAHARAST", "", "Co-Founder & Head Of Customer Service at Shopyan", "assets/speakers/speakers2024/6.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Jalal", "AAOUITA", "", "Serial Entrepreneur, Startup Enthusiast & Social Militant", "assets/speakers/speakers2024/7.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Imad ", "EL MANSOUR ZEKRI", "", "Founder & CEO of Cathedis", "assets/speakers/speakers2024/8.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Salah Eddine", "MIMOUNI", "", "PhD, Conférencier International et Expert en Marketing Digital", "assets/speakers/speakers2024/9.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Hassan ", "AANBAR", "", "Co-Founder of PrimeCOD", "assets/speakers/speakers2024/10.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Adil", "BARRA","","Co-Founder of PrimeCOD", "assets/speakers/speakers2024/11.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Yassine", "WAHABI", "", "Founder of SPAYPO & E-commerce Expert", "assets/speakers/speakers2024/12.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Ayoub", "ZERI", "","Founder & CEO of ONESSTA", "assets/speakers/speakers2024/13.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Noureddine", "KHITI", "", "Chief Executive Officer at Codshopy.com", "assets/speakers/speakers2024/14.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Mohammed", "MESTOUR", "", "COD in Africa Expert, Co-Founder of X10LEAD, Co-Founder of growad.ma & E-commerce consultant", "assets/speakers/speakers2024/15.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Youness", "AbdeEL BAKALIlmajid", "", "Entrepreneur, Multi 7-figure ecommerce stores, Co-Founder of GROWAD & Co-Founder of X10LEAD", "assets/speakers/speakers2024/16.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Imane ", "ID SALEM", "", "Co-Founder & CEO of AfricaShip", "assets/speakers/speakers2024/17.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Mamoon", "AL SABBAGH", "", "Co-Founder & CEO of NINJA SELLERS", "assets/speakers/speakers2024/18.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Samir ", "EL ATCHI", "", "Founder of eComya", "assets/speakers/speakers2024/19.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Gala ", "GRIGOREVA", "", "CMO at Adsterra Network", "assets/speakers/speakers2024/20.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Rida ", "CHADLI", "", "Founder of eComya", "assets/speakers/speakers2024/21.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Julien ", "GUYARD", "", "Fondateur de Caméléon Média - Partenaire Stratégique de Sendit", "assets/speakers/speakers2024/22.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Youssef ", "YATIM", "", "Project manager at Sendit", "assets/speakers/speakers2024/23.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Jalal ", "BADER", "", "CFounder & CEO of high delivery And MegaTech", "assets/speakers/speakers2024/24.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Moncef ", "FETTAH", "", "CCo-Founder & CEO of Sandbox", "assets/speakers/speakers2024/25.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Mariam ", "GUERNI", "", "Social Media Manager at Sandbox", "assets/speakers/speakers2024/26.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Ayoub ", "COPYWRITER", "", "Expert in Copywriting & Ecommerce Videos Ads", "assets/speakers/speakers2024/27.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Noureddine ", "IOUIRI", "", "Founder of ECOM FIGHTERS", "assets/speakers/speakers2024/28.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Othmane ", "BLIT", "", "Import-Export Expert Co-Founder & CEO of ECOVERSA COD in Morocco Specialist", "assets/speakers/speakers2024/29.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Allal ", "MARRAKCHI", "", "Fondateur de YOUPACK et Expert en opérations e-commerce", "assets/speakers/speakers2024/30.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Fadwa ", "JALIL", "", "Responsable qualité et formation", "assets/speakers/speakers2024/31.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Dr. Abdelmajid ", "CHARRASS", "", "Ex-Directeur Régional du Centre Monétique Interbancaire (10ans) Cofondateur de la plateforme NSAYBLIK.com", "assets/speakers/speakers2024/32.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Mohammed ", "EL MAKHROUBI", "", "Radio & Podcast Presenter", "assets/speakers/speakers2024/33.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Haimond ", "NEINKHA GBOHO", "", "Founder & CEO of Tuwshiyah Agency", "assets/speakers/speakers2024/34.png", isRecommended: false, isFavorite: false));
    _allSpeakers.add(Speakers("Said ", "BOUBAKRI", "", "Expert in E-Commerce & Digital Marketing Consultant", "assets/speakers/speakers2024/35.png", isRecommended: false, isFavorite: false));

    // Filter into recommended and other speakers
    _recommendedSpeakers = _allSpeakers.where((speaker) => speaker.isRecommended).toList();
    _otherSpeakers = _allSpeakers.where((speaker) => !speaker.isRecommended).toList();

    // Sort other speakers by last name for alphabetical grouping
    _otherSpeakers.sort((a, b) => a.lname.compareTo(b.lname));

    setState(() {
      _filteredOtherSpeakers = _otherSpeakers; // Initialize filtered list
      isLoading = false;
    });
  }

  void _filterSpeakers() {
    String query = _searchController.text.toLowerCase();
    List<Speakers> currentSourceList = _otherSpeakers; // Always filter the non-recommended list

    List<Speakers> searchResults = currentSourceList.where((speaker) {
      final fullName = "${speaker.fname} ${speaker.lname}".toLowerCase();
      final characteristic = speaker.characteristic.toLowerCase();
      return fullName.contains(query) || characteristic.contains(query);
    }).toList();

    // Apply favorite filter if active
    if (_isFavoriteFilterActive) {
      searchResults = searchResults.where((speaker) => speaker.isFavorite).toList();
    }

    setState(() {
      _filteredOtherSpeakers = searchResults;
      if (searchResults.isEmpty && query.isNotEmpty) {
        Fluttertoast.showToast(msg: "Search not found...!", toastLength: Toast.LENGTH_SHORT);
      } else if (searchResults.isEmpty && _isFavoriteFilterActive && query.isEmpty) {
        Fluttertoast.showToast(msg: "No favorited speakers to show...!", toastLength: Toast.LENGTH_SHORT);
      }
    });
  }

  void _toggleFavoriteFilter() {
    setState(() {
      _isFavoriteFilterActive = !_isFavoriteFilterActive;
      _filterSpeakers(); // Re-apply filters based on new state
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

    // Group non-recommended speakers by first letter of last name
    Map<String, List<Speakers>> groupedOtherSpeakers = {};
    for (var speaker in _filteredOtherSpeakers) {
      String firstLetter = speaker.lname.isNotEmpty ? speaker.lname[0].toUpperCase() : '#';
      if (!groupedOtherSpeakers.containsKey(firstLetter)) {
        groupedOtherSpeakers[firstLetter] = [];
      }
      groupedOtherSpeakers[firstLetter]!.add(speaker);
    }
    // Sort keys alphabetically
    List<String> sortedKeys = groupedOtherSpeakers.keys.toList()..sort();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector( // Added GestureDetector to dismiss keyboard on tap outside
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white, // Overall white background
          appBar: AppBar(
            backgroundColor:Colors.black, // Dark blue background, as per image
            elevation: 0, // No shadow
            title: Text(
              'Speakers', // Title
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.tune, color: Colors.white), // Filter icon
                onPressed: () {
                  // Handle filter (if any other filter apart from favorite is needed)
                },
              ),
              IconButton(
                icon: Icon(
                  _isFavoriteFilterActive ? Icons.star : Icons.star_border, // Star icon for favorite filter
                  color: _isFavoriteFilterActive ? Color(0xff00c1c1) : Colors.white, // Color based on active state
                ),
                onPressed: _toggleFavoriteFilter, // Toggle favorite filter
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
                  // Recommended Speakers Section
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.04, height * 0.02, width * 0.04, height * 0.01),
                    child: Text(
                      'Recommended', // "Recommended" label
                      style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.22, // Adjusted height to accommodate more text and spacing
                    child: _recommendedSpeakers.isEmpty
                        ? Center(
                      child: Text("No recommended speakers found.", style: TextStyle(color: Colors.grey)),
                    )
                        : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      itemCount: _recommendedSpeakers.length,
                      itemBuilder: (context, index) {
                        return _buildRecommendedSpeakerCard(_recommendedSpeakers[index], width, height);
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  // Alphabetically Grouped Speakers Section
                  if (_filteredOtherSpeakers.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          _searchController.text.isNotEmpty
                              ? "No speakers found for your search."
                              : (_isFavoriteFilterActive ? "No favorited speakers to display." : "No speakers to display."),
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
                            itemCount: groupedOtherSpeakers[letter]!.length,
                            itemBuilder: (context, index) {
                              return _buildSpeakerListItem(groupedOtherSpeakers[letter]![index], width, height);
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

  // Widget for Recommended Speaker Cards (horizontal scroll)
  Widget _buildRecommendedSpeakerCard(Speakers speaker, double width, double height) {
    return Container(
      width: width * 0.35, // Width of each card
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
      ),
      child: GestureDetector(
        onTap: () {
          // Navigate to speaker details
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailSpeakersScreen()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipOval(
                    child: Image.asset(
                      speaker.image,
                      width: width * 0.18, // Size of circular image
                      height: width * 0.18,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned( // Use Positioned for better control of the star icon
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        speaker.isFavorite ? Icons.star : Icons.star_border, // Filled or outlined star
                        color: speaker.isFavorite ? Color(0xff00c1c1) : Colors.grey, // Color based on favorite status
                        size: width * 0.05,
                      ),
                      onPressed: () {
                        setState(() {
                          speaker.isFavorite = !speaker.isFavorite; // Toggle favorite status
                          // No need to call _filterSpeakers here unless recommended list is also filtered by favorites
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
              Text(
                "${speaker.fname} ${speaker.lname}", // Full name
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2.0),
              Text(
                speaker.characteristic,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height * 0.014,
                  color: Colors.grey[700],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for Speaker List Items (vertical list)
  Widget _buildSpeakerListItem(Speakers speaker, double width, double height) {
    return InkWell(
      onTap: () {
        // Navigate to speaker details
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailSpeakersScreen()),
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
            // Circular Image
            ClipOval(
              child: Image.asset(
                speaker.image,
                width: width * 0.12, // Size of circular image
                height: width * 0.12,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: width * 0.04), // Spacing

            // Name and Title
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${speaker.fname} ${speaker.lname}",
                    style: TextStyle(
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    speaker.characteristic,
                    style: TextStyle(
                      fontSize: height * 0.016,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Star Icon
            IconButton(
              icon: Icon(
                speaker.isFavorite ? Icons.star : Icons.star_border, // Filled or outlined star
                color: speaker.isFavorite ? Color(0xff00c1c1) : Colors.grey, // Color based on favorite status
                size: width * 0.06,
              ),
              onPressed: () {
                setState(() {
                  speaker.isFavorite = !speaker.isFavorite; // Toggle favorite status
                  _filterSpeakers(); // Re-apply filters to update the list if favorite filter is active
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Updated Speakers Model (make sure this is in model/speakers_model.dart)
class Speakers {
  String fname;
  String lname;
  String company; // Keeping company field for consistency, though not used in UI yet
  String characteristic;
  String image;
  bool isRecommended;
  bool isFavorite; // New field for favorite status

  Speakers(this.fname, this.lname, this.company, this.characteristic, this.image, {this.isRecommended = false, this.isFavorite = false});
}

// Dummy DetailSpeakersScreen (make sure this is in details/DetailSpeakeres.dart)
class DetailSpeakersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speaker Details'),
      ),
      body: Center(
        child: Text('Details about the speaker.'),
      ),
    );
  }
}