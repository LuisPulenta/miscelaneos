import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Miscelaneos'),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      context.push('/permissions');
                    }),
              ],
            ),
            const MainMenu(),
          ],
        ),
      ),
    );
  }
}
