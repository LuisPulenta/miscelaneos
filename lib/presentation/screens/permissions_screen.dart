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
    return ListView(
      children: [
        CheckboxListTile(
          value: true,
          onChanged: (value) {},
          title: const Text('Cámara'),
          subtitle: const Text('Estado actual'),
        ),
      ],
    );
  }
}
