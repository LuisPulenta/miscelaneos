import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('MapScreen'),
      ),
    );
  }
}
