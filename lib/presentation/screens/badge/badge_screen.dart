import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badgeCounter = ref.watch(badgeCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Badge'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              alignment: Alignment.lerp(
                  Alignment.topRight, Alignment.bottomRight, 0.2),
              label: Text('$badgeCounter'),
              child: Text('$badgeCounter',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 150,
                      fontWeight: FontWeight.bold)),
            ),
            FilledButton.tonal(
                onPressed: () {
                  ref.invalidate(badgeCounterProvider);
                },
                child: const Text('Borrar Badge')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(badgeCounterProvider.notifier).update((state) => state + 1);
          AppBadgePlugin.updateBadgeCount(badgeCounter + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
