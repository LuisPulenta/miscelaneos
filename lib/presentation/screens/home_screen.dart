import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Miscelaneos'),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.push('/permissions');
              }),
        ],
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Miscelaneos'),
      ),
    );
  }
}
