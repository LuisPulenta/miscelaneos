import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometricProvider);
    final localAuthState = ref.watch(localAuthProvider);

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
              onPressed: () {
                ref
                    .read(localAuthProvider.notifier)
                    .authenticateUser(biometricOnly: false);
              },
              child: const Text('Autenticar'),
            ),
            canCheckBiometrics.when(
                data: (canCheck) =>
                    Text('Puede revisar biométricos: $canCheck'),
                error: (error, stackTrace) => Text('Error: $error'),
                loading: () => const SizedBox()),
            const Text(
              'Estado del biométrico',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'Estado $localAuthState',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
