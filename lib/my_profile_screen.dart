import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xff261350),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Content for My Profile goes here.'),
      ),
    );
  }
}