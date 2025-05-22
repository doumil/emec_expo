import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import for SharedPreferences
import 'package:emec_expo/model/exhibitors_model.dart'; // Import the ExhibitorsClass model

// You might not need 'DetailSpeakers.dart' or 'speakers_model.dart' here
// if this screen is strictly for exhibitors. If you intend to show speakers
// related to this exhibitor, then you'd refactor that logic.
// For now, removing the Speaker related imports as they cause confusion here.
// import 'package:emec_expo/details/DetailSpeakers.dart';
// import '../model/speakers_model.dart';

class DetailExhibitorsScreen extends StatefulWidget {
  const DetailExhibitorsScreen({Key? key}) : super(key: key);

  @override
  _DetailExhibitorsScreenState createState() => _DetailExhibitorsScreenState();
}

class _DetailExhibitorsScreenState extends State<DetailExhibitorsScreen> {
  // Use ExhibitorsClass here, not Speakers
  ExhibitorsClass? _currentExhibitor;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExhibitorDetails(); // Load details based on ID from SharedPreferences
  }

  // This method will load the specific exhibitor's data
  _loadExhibitorDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? exhibitorIdString = prefs.getString("Data"); // Get the ID string

    if (exhibitorIdString != null) {
      int? exhibitorId = int.tryParse(exhibitorIdString);

      // --- SIMULATE FETCHING DATA ---
      // In a real app, you would fetch this exhibitor's data from an API
      // using exhibitorId. For this example, we'll use a dummy list.
      // Make sure this dummy data matches the structure you have in ExhibitorsScreen's _loadData.
      List<ExhibitorsClass> allExhibitorsDummy = [
        ExhibitorsClass(0,'TECHNOPARK', 'ED240', 'Incubateur technologique', 'Casablanca, Morocco', 'Full description for Technopark. This is a more detailed description about Technopark and its innovative projects. They focus on fostering technological entrepreneurship.', 'www.technopark.ma', 'assets/partners/1.png', false, true, isRecommended: true),
        ExhibitorsClass(1, 'AMMC', 'EF300', 'Autorité des marchés financiers', 'Rabat, Morocco', 'Full description for AMMC. The Autorité Marocaine du Marché des Capitaux (AMMC) regulates and supervises the Moroccan capital market, ensuring its transparency and integrity.', 'www.ammc.ma', 'assets/partners/2.png', false, false, isRecommended: true),
        ExhibitorsClass(2,'MEDI 1 RADIO', 'RZ901', 'Radio d\'information continue', 'Tanger, Morocco', 'Full description for Medi 1 Radio. Medi 1 Radio is a leading continuous news radio station in the Maghreb region, providing diverse programming.', 'www.medi1radio.com', 'assets/partners/3.png', false, false, isRecommended: true),
        ExhibitorsClass(3,'ABC Solutions', 'FG450', 'Solutions IT innovantes', 'Fes, Morocco', 'Full description for ABC Solutions. ABC Solutions specializes in providing innovative IT solutions and services to businesses across various sectors.', 'www.abcsolutions.ma', 'assets/partners/4.png', false, false, isRecommended: true),
        ExhibitorsClass(4, 'Quantum Tech', 'XY100', 'Expert en cybersécurité', 'Marrakech, Morocco', 'Full description for Quantum Tech. Quantum Tech offers advanced cybersecurity solutions and consulting to protect digital assets and infrastructure.', 'www.quantumtech.ma', 'assets/partners/5.png', false, true),
        ExhibitorsClass(5,'ZETA Corp', 'AB200', 'Développement de logiciels', 'Agadir, Morocco', 'Full description for Zeta Corp. Zeta Corp is a software development company focusing on bespoke applications and enterprise solutions.', 'www.zetacorp.ma', 'assets/partners/6.png', false, false),
        ExhibitorsClass(6,'Innovate Hub', 'CD301', 'Espace de co-working', 'Rabat, Morocco', 'Full description for Innovate Hub. Innovate Hub provides flexible co-working spaces and a vibrant community for startups and freelancers.', 'www.innovatehub.ma', 'assets/partners/7.png', false, false),
        ExhibitorsClass(7, 'Global Connect', 'EF400', 'Fournisseur de services internet', 'Casablanca, Morocco', 'Full description for Global Connect. Global Connect is a leading internet service provider, offering high-speed connectivity and reliable network solutions.', 'www.globalconnect.ma', 'assets/partners/8.png', false, false),
        ExhibitorsClass(8,'Digital Dreams', 'GH500', 'Agence de marketing digital', 'Tanger, Morocco', 'Full description for Digital Dreams. Digital Dreams is a full-service digital marketing agency specializing in SEO, social media, and content creation.', 'www.digitaldreams.ma', 'assets/partners/9.png', false, false),
        ExhibitorsClass(9,'Eco Ventures', 'IJ600', 'Solutions écologiques', 'Fes, Morocco', 'Full description for Eco Ventures. Eco Ventures develops and implements sustainable and eco-friendly solutions for environmental challenges.', 'www.ecoventures.ma', 'assets/partners/10.png', false, false),
        ExhibitorsClass(10, 'Future Systems', 'KL700', 'Intégrateur de systèmes', 'Marrakech, Morocco', 'Full description for Future Systems. Future Systems is a systems integrator providing comprehensive technology solutions for businesses.', 'www.futuresystems.ma', 'assets/partners/11.png', false, false),
        ExhibitorsClass(11,'Green Energy Co', 'MN800', 'Énergies renouvelables', 'Agadir, Morocco', 'Full description for Green Energy Co. Green Energy Co specializes in renewable energy projects, including solar and wind power installations.', 'www.greenenergy.ma', 'assets/partners/12.png', false, false),
        ExhibitorsClass(12,'Bright Minds', 'OP900', 'Formations professionnelles', 'Casablanca, Morocco', 'Full description for Bright Minds. Bright Minds offers professional training programs and workshops to enhance skills and career development.', 'www.brightminds.ma', 'assets/partners/13.png', false, false),
      ];

      await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay

      setState(() {
        _currentExhibitor = allExhibitorsDummy.firstWhere(
              (exhibitor) => exhibitor.id == exhibitorId,
          orElse: () => ExhibitorsClass(
              -1, 'Error', 'N/A', 'Exhibitor not found', 'N/A', 'Details not available.', 'N/A', 'assets/placeholder_error.png', false, false), // Default error exhibitor
        );
        isLoading = false;
      });
    } else {
      setState(() {
        _currentExhibitor = ExhibitorsClass(
            -1, 'Error', 'N/A', 'No ID provided', 'N/A', 'No exhibitor ID was passed to this screen.', 'N/A', 'assets/placeholder_error.png', false, false);
        isLoading = false;
      });
    }
  }


  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Êtes-vous sûr'),
        content: Text('Voulez-vous quitter cette page ?'), // Modified text
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Non'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Pop this screen
            child: Text('Oui'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Loading Details"),
          backgroundColor: Color(0xff261350),
          elevation: 0,
        ),
        body: Center(
          child: CircularProgressIndicator(color: Color(0xff00c1c1)),
        ),
      );
    }

    // If _currentExhibitor is null or error, show an error message
    if (_currentExhibitor == null || _currentExhibitor!.id == -1) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Exhibitor Not Found"),
          backgroundColor: Color(0xff261350),
          elevation: 0,
        ),
        body: Center(
          child: Text(
            _currentExhibitor?.shortDiscriptions ?? "Failed to load exhibitor details.",
            style: TextStyle(fontSize: 18, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(_currentExhibitor!.title), // Dynamically set title
          backgroundColor: Color(0xff261350),
          elevation: 0,
        ),
        body: SingleChildScrollView( // Use SingleChildScrollView for long content
          child: Container(
            color: Colors.white, // Changed background to white for contrast
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to start
              children: [
                Container(
                  margin: EdgeInsets.only(top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top), // Account for AppBar and safe area
                  padding: EdgeInsets.all(width * 0.04), // Padding around the card
                  child: Card(
                    color: Colors.white,
                    elevation: 4, // Add some shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              _currentExhibitor!.image, // Dynamically load image
                              width: width * 0.4, // Adjust size
                              height: width * 0.4,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/placeholder_error.png', // Fallback
                                  width: width * 0.4,
                                  height: width * 0.4,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            _currentExhibitor!.title, // Dynamically set title
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            'Stand: ${_currentExhibitor!.stand}', // Display stand
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: height * 0.018,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            _currentExhibitor!.adress, // Display address
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: height * 0.018,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            'Website: ${_currentExhibitor!.siteweb}', // Display website
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue, // Make it look like a link
                              fontSize: height * 0.018,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Divider(),
                          SizedBox(height: height * 0.02),
                          Text(
                            _currentExhibitor!.discriptions, // Full description
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: height * 0.018,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}