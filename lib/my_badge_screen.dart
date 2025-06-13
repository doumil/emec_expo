import 'package:flutter/material.dart';

class MyBadgeScreen extends StatelessWidget {
  const MyBadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Badge'),
        backgroundColor: const Color(0xff261350),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Content for My Badge goes here.'),
      ),
    );
  }
}