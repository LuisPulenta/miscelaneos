import 'package:flutter/material.dart';

class AdRewardedScreen extends StatelessWidget {
  const AdRewardedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdRewardedScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Puntos actuales: '),
      ),
    );
  }
}
