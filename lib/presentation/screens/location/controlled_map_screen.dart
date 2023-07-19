import 'package:flutter/material.dart';

class ControlledMapScreen extends StatelessWidget {
  const ControlledMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ControlledMapScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('ControlledMapScreen'),
      ),
    );
  }
}
