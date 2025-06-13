import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: const Color(0xff261350),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Content for Messages goes here.'),
      ),
    );
  }
}