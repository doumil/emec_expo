import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xff261350), // Dark purple color for AppBar
        foregroundColor: Colors.white, // White text/icons on AppBar
        centerTitle: true, // Center the title
        elevation: 0, // No shadow below the AppBar, making it flat
      ),
      body: Stack( // Using Stack to layer the background cover and scrollable content
        children: [
          // Background "Cover" Area - top section of the profile screen
          Container(
            height: 180, // Height of the background cover area
            color: const Color(0xFFE0E0E0), // Light grey color, mimicking the image background
          ),
          // SingleChildScrollView for the main profile content, allowing it to scroll if needed
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to fill horizontal space
              children: <Widget>[
                const SizedBox(height: 30), // Initial spacing from the top of the screen

                // Profile Picture/Initials section
                Padding(
                  padding: const EdgeInsets.only(top: 20.0), // Pushes the profile picture down into the cover area
                  child: Center(
                    child: Container(
                      width: 120, // Diameter of the circular profile picture
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueAccent, // Pink background for the initials
                      ),
                      child: const Center(
                        child: Text(
                          'YD', // Initials updated to 'YD'
                          style: TextStyle(
                            color: Colors.white, // White text for initials
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Spacing below the profile picture

                // User Name
                const Center(
                  child: Text(
                    'YASSINE DOUMIL', // User name updated to 'YASSINE DOUMIL'
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Spacing below the name

                // User Details (Manager, Company, Location)
                Center(
                  child: Column(
                    children: const <Widget>[
                      Text(
                        'devloper', // Role updated to 'devloper'
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'SUBGENIOS sarl', // Company detail
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Morocco', // Location detail
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30), // Spacing before "My Interests" section

                // My Interests Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Horizontal padding for this section
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
                    children: <Widget>[
                      const Text(
                        'My Interests', // Section heading
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10), // Spacing below the heading
                      Wrap( // Allows interests chips to wrap to the next line
                        spacing: 8.0, // Horizontal space between chips
                        runSpacing: 4.0, // Vertical space between rows of chips
                        children: <Widget>[
                          _buildInterestTag('Networking & Infrastructure', context), // Interest tag
                          _buildInterestTag('Other', context), // Interest tag
                          // Add more _buildInterestTag widgets here for additional interests
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80), // Provides space at the bottom so FAB doesn't overlap content
              ],
            ),
          ),
        ],
      ),
      // Floating Action Button for editing profile
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement the logic for editing the profile when this button is pressed
          debugPrint('Edit profile button tapped!');
        },
        backgroundColor: Colors.black87, // Dark background for the FAB
        foregroundColor: Colors.white, // White text and icon color for the FAB
        icon: const Icon(Icons.edit), // Pencil icon
        label: const Text('Edit'), // Text label "Edit"
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Positions the FAB at the bottom-right

      // Removed bottomNavigationBar as per your latest code
    );
  }

  // Helper method to build individual interest tags (Chips)
  Widget _buildInterestTag(String interest, BuildContext context) {
    return Chip(
      label: Text(
        interest,
        style: const TextStyle(color: Colors.black87), // Text color for the chip label
      ),
      backgroundColor: Colors.grey.shade200, // Light grey background for the chip
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Rounded corners for the chip
      ),
    );
  }
}