import 'package:flutter/material.dart';

class CompassScreen extends StatelessWidget {
  const CompassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brújula'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Brújula'),
      ),
    );
  }
}
