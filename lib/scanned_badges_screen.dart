import 'package:flutter/material.dart';

class ScannedBadgesScreen extends StatelessWidget {
  const ScannedBadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned Badges'),
        backgroundColor: const Color(0xff261350),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Content for Scanned Badges goes here.'),
      ),
    );
  }
}