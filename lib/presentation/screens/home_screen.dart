import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';
import 'package:miscelaneos/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addBannerAsync = ref.watch(adBannerProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
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
          ),
          addBannerAsync.when(
              data: (bannerAd) => SizedBox(
                    width: bannerAd.size.width.toDouble(),
                    height: bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: bannerAd),
                  ),
              error: (_, __) => const SizedBox(),
              loading: () => const SizedBox())
        ],
      ),
    );
  }
}
