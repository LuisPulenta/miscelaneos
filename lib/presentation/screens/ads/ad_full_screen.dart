import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AdFullScreen extends ConsumerWidget {
  const AdFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interstitialAdAsync = ref.watch(adIntersticialProvider);

    if (interstitialAdAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: Text('Cargando ad'),
        ),
      );
    }

    if (interstitialAdAsync.hasValue) {
      interstitialAdAsync.value!.show();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('AdFullScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Ya puedes regresar o ver eta pantalla'),
      ),
    );
  }
}
