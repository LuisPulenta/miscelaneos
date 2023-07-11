import 'package:flutter/material.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometrics'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Autenticar'),
            ),
            //TODO: Feedback del proceso
            const Text(
              'Estado del biométrico',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'Estado XXXX',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
