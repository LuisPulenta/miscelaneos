import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchUserLocation = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ControlledMapScreen'),
        centerTitle: true,
      ),
      body: watchUserLocation.when(
          data: (data) => _MapAndControls(
                latitude: data.$1,
                longitude: data.$2,
              ),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const Center(
                child: Text('Ubicando usuario...'),
              )),
    );
  }
}

//-------------------------------------------------------------

class _MapAndControls extends StatelessWidget {
  final double latitude;
  final double longitude;
  const _MapAndControls({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
