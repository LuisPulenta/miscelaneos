import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
        centerTitle: true,
      ),
      body: const _PermissionsView(),
    );
  }
}

//---------------- _PermissionsView --------------------
class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissions = ref.watch(permissionsProvider);
    final showAds = ref.watch(showAdsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          value: permissions.cameraGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
          title: const Text('Cámara'),
          subtitle: Text('${permissions.camera}'),
        ),
        CheckboxListTile(
          value: permissions.locationGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
          title: const Text('Ubicación'),
          subtitle: Text('${permissions.location}'),
        ),
        CheckboxListTile(
          value: permissions.sensorsGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          },
          title: const Text('Sensores'),
          subtitle: Text('${permissions.sensors}'),
        ),
        CheckboxListTile(
          value: showAds,
          onChanged: (_) {
            ref.read(showAdsProvider.notifier).toggleAds();
          },
          title: const Text('Mostrar Ads'),
          subtitle: const Text('Esta opción muestra y oculta Ads'),
        ),
      ],
    );
  }
}
