import 'package:flutter/material.dart';

class MagnetometerScreen extends StatelessWidget {
  const MagnetometerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetómetro'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Magnetómetro'),
      ),
    );
  }
}
