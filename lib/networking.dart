import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// Assuming this path is correct for your detail screen
import 'details/DetailNetworkin.dart';

// Importing your NetworkinClass model
import 'model/Networkin_model.dart';

class NetworkinScreen extends StatefulWidget {
  const NetworkinScreen({Key? key}) : super(key: key);

  @override
  _NetworkinScreenState createState() => _NetworkinScreenState();
}

class _NetworkinScreenState extends State<NetworkinScreen> {
  // Using your NetworkinClass list
  List<NetworkinClass> litems = [];
  bool isLoading = true;
  late PageController _pageController; // Controller for PageView
  int _currentPageIndex = 0; // To track current profile shown

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    _loadData(); // Using your original _loadData method name
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _loadData() async {
    // Your original hardcoded data for NetworkinClass
    var ex1 = NetworkinClass(0, 'TECHNOPARK', 'ED240', '', '', '', '',
        'assets/partners/1.png', false, false);
    litems.add(ex1);
    var ex2 = NetworkinClass(1, 'AMMC', 'EF300', '', '', '', '',
        'assets/partners/2.png', false, false);
    litems.add(ex2);
    var ex3 = NetworkinClass(2, 'MEDI 1 RADIO', 'RZ901', '', '', '', '',
        'assets/partners/3.png', false, false);
    litems.add(ex3);
    var ex4 = NetworkinClass(3, 'TECHNOPARK', 'ED240', '', '', '', '',
        'assets/partners/4.png', false, false);
    litems.add(ex4);
    var ex5 = NetworkinClass(4, 'AMMC', 'EF300', '', '', '', '',
        'assets/partners/5.png', false, false);
    litems.add(ex5);
    var ex6 = NetworkinClass(5, 'MEDI 1 RADIO', 'RZ901', '', '', '', '',
        'assets/partners/6.png', false, false);
    litems.add(ex6);
    var ex7 = NetworkinClass(6, 'TECHNOPARK', 'ED240', '', '', '', '',
        'assets/partners/7.png', false, false);
    litems.add(ex7);
    var ex8 = NetworkinClass(7, 'AMMC', 'EF300', '', '', '', '',
        'assets/partners/7.png', false, false); // Note: using same image as ex7
    litems.add(ex8);
    var ex9 = NetworkinClass(8, 'MEDI 1 RADIO', 'RZ901', '', '', '', '',
        'assets/partners/8.png', false, false);
    litems.add(ex9);
    var ex10 = NetworkinClass(9, 'TECHNOPARK', 'ED240', '', '', '', '',
        'assets/partners/9.png', false, false);
    litems.add(ex10);
    var ex11 = NetworkinClass(10, 'AMMC', 'EF300', '', '', '', '',
        'assets/partners/10.png', false, false);
    litems.add(ex11);
    var ex12 = NetworkinClass(11, 'MEDI 1 RADIO', 'RZ901', '', '', '', '',
        'assets/partners/11.png', false, false);
    litems.add(ex12);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to move to the next profile
  void _nextProfile() {
    if (_currentPageIndex < litems.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Handle end of profiles (e.g., show a message, loop, navigate)
      print("No more profiles to show!");
      // Optionally, loop back to the beginning
      // _pageController.jumpToPage(0);
      // _currentPageIndex = 0;
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Êtes-vous sûr'),
        content: const Text('Voulez-vous quitter cette application'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Non'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text('Oui '),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey[100], // Light grey background
        appBar: AppBar(
          backgroundColor: const Color(0xFF261350), // Dark blue background
          elevation: 0, // No shadow
          title: const Text(
            'Networking', // Title from image
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true, // Center the title
          actions: [
            /*Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                 // const Icon(Icons.network_cell, color: Colors.white), // 4G icon
                 // const SizedBox(width: 4),
                  const Text('4G', style: TextStyle(color: Colors.white)), // 4G text
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    // Corrected const usage for BoxDecoration and BorderRadius
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(4)), // Now const
                    ),
                    child: const Text(
                      '78', // Battery percentage (dummy data as not in model)
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
        body: isLoading
            ? Center(
          child: SpinKitThreeBounce(
            color: const Color(0xff00c1c1),
            size: 30.0,
          ),
        )
            : Column(
          children: [
            Expanded(
              child: FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: litems.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final profile = litems[index];
                    return _buildNetworkingCard(profile);
                  },
                ),
              ),
            ),
            _buildActionButtons(),
            _buildMatchButton(),
            const SizedBox(height: 10), // Spacing before bottom nav
          ],
        ),
      ),
    );
  }

  Widget _buildNetworkingCard(NetworkinClass profile) {
    // Dummy data for fields not present in NetworkinClass
    final String dummyLocation = "France";
    final int dummyMatchPercentage = 94; // Using a fixed value from image
    final List<String> dummyInterests = const [ // Marked as const as all its elements are const
      'Chatbots / Virtual Assistant',
      'Natural Language Generation (NLG)',
      'Artificial Intelligence',
      'Computer Vision',
    ];

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: Colors.white, // White card background
        elevation: 5.0, // Card shadow
        shape: RoundedRectangleBorder(
          // Corrected const usage for BorderRadius
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          profile.image, // Using image from NetworkinClass
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.person, size: 80, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile.title, // Using title from NetworkinClass
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF261350), // Dark blue text
                            ),
                          ),
                          Text(
                            dummyLocation, // Using dummy location
                            style:  TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                      color: Color(0xFF261350), // Dark blue background for percentage
                      borderRadius: BorderRadius.all(Radius.circular(5)), // Now const
                    ),
                    child: Text(
                      '${dummyMatchPercentage}%', // Using dummy percentage
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories of interest', // Title for interests
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF261350), // Dark blue text
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0, // horizontal spacing between chips
                    runSpacing: 8.0, // vertical spacing between lines of chips
                    children: dummyInterests.map((interest) {
                      return Chip(
                        label: Text(
                          interest,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        backgroundColor: const Color(0xFFFF69B4), // Pinkish color for chips
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            // The large blank space below interests in the image
            const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    // Ensure litems is not empty before accessing _currentPageIndex
    if (litems.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionButton(Icons.chat_bubble_outline, () {
            // Logic for message
            print("Message button pressed for ${litems[_currentPageIndex].title}");
            _nextProfile(); // Go to next profile after action
          }, Colors.blueGrey), // Example color
          _buildActionButton(Icons.close, () {
            // Logic for dismiss
            print("Dismiss button pressed for ${litems[_currentPageIndex].title}");
            _nextProfile(); // Go to next profile
          }, Colors.black), // Dark grey for close icon
          _buildActionButton(
            litems[_currentPageIndex].star ? Icons.star : Icons.star_border, // Using NetworkinClass.star
                () {
              setState(() {
                litems[_currentPageIndex].star = !litems[_currentPageIndex].star; // Update star state
                print("Star button pressed for ${litems[_currentPageIndex].title}, favorite: ${litems[_currentPageIndex].star}");
              });
              _nextProfile(); // Go to next profile
            },
            litems[_currentPageIndex].star ? Colors.yellow[700]! : Colors.orange, // Yellow for filled star
          ),
          _buildActionButton(Icons.calendar_today_outlined, () {
            // Logic for calendar/schedule
            print("Calendar button pressed for ${litems[_currentPageIndex].title}");
            _nextProfile(); // Go to next profile
          }, Colors.purple), // Example color
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onPressed, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.white, // White background for circular buttons
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(icon, size: 28, color: color), // Icon size and color
          ),
        ),
      ),
    );
  }

  Widget _buildMatchButton() {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Container(
        width: double.infinity, // Full width
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: const Color(0xFFE50000), // Red button background
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: TextButton(
          onPressed: () {
            // Navigate to matches screen
            print("Afficher mes matches button pressed!");
            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => MatchesScreen()));
          },
          // CORRECTED: All children of this const Row are now also const
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text( // Added const here
                'Afficher mes matches', // Button text
                style: const TextStyle( // Added const here
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10), // Added const here
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24), // Added const here
            ],
          ),
        ),
      ),
    );
  }
}