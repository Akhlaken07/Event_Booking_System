import 'package:flutter/material.dart';

class DisplayVenue extends StatelessWidget {
  const DisplayVenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Display Booked Venue'),
      ),
      body: Column(
        children: [
          Text('Venue 1'),
          
        ],
      ),
    );
  }
}