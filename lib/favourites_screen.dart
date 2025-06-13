// lib/favourites_screen.dart
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget { // <--- CHANGE THIS LINE
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'), // <--- Ensure title is correct
        backgroundColor: const Color(0xff261350),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Content for Favourites goes here.'),
      ),
    );
  }
}