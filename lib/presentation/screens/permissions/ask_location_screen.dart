import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/permissions/permissions_provider.dart';

class AskLocationScreen extends ConsumerWidget {
  const AskLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permiso requerido'),
        centerTitle: true,
      ),
      body: Center(
          child: FilledButton(
              onPressed: () {
                ref.read(permissionsProvider.notifier).requestLocationAccess();
              },
              child: const Text('Localización necesaria'))),
    );
  }
}
