// lib/my_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:emec_expo/model/profile_model.dart'; // Adjust import path

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example Profile data. In a real app, this would come from a backend or state management.
    final Profile userProfile = Profile(
      initials: 'YD', // From your last update
      name: 'YASSINE DOUMIL', // From your last update
      role: 'devloper', // From your last update
      company: 'SUBGENIOS sarl',
      location: 'Morocco',
      interests: ['Networking & Infrastructure', 'Other', 'Mobile Development', 'Web Technologies'],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xff261350),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background "Cover" Area
          Container(
            height: 180,
            color: const Color(0xFFE0E0E0),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 30),

                // Profile Picture/Initials section
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pinkAccent,
                      ),
                      child: Center(
                        child: Text(
                          userProfile.initials, // Using data from model
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // User Name
                Center(
                  child: Text(
                    userProfile.name, // Using data from model
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // User Details (Role, Company, Location)
                Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        userProfile.role, // Using data from model
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        userProfile.company, // Using data from model
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        userProfile.location, // Using data from model
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // My Interests Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'My Interests',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: userProfile.interests.map((interest) { // Using data from model
                          return _buildInterestTag(interest);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          debugPrint('Edit profile button tapped!');
        },
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.edit),
        label: const Text('Edit'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // _buildInterestTag no longer needs BuildContext as it's not directly styling from theme
  Widget _buildInterestTag(String interest) {
    return Chip(
      label: Text(
        interest,
        style: const TextStyle(color: Colors.black87),
      ),
      backgroundColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}