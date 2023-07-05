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
          value: permissions.photoLibraryGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
          },
          title: const Text('Galería de fotos'),
          subtitle: Text('${permissions.photoLibrary}'),
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
      ],
    );
  }
}
