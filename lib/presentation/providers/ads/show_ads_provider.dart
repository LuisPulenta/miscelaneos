import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';

//--------------------- Provider -------------------------

final showAdsProvider = StateNotifierProvider<ShowAdsNotifier, bool>((ref) {
  return ShowAdsNotifier();
});

//--------------------- Notifier -------------------------
class ShowAdsNotifier extends StateNotifier<bool> {
  ShowAdsNotifier() : super(false) {
    checkAdsState();
  }

//--------------------- State ---------------------------
  void checkAdsState() async {
    state = await SharedPreferencesPlugin.getBool('showAds');
  }

  void removeAds() {
    SharedPreferencesPlugin.setBool('showAds', false);
    state = false;
  }

  void showAds() {
    SharedPreferencesPlugin.setBool('showAds', true);
    state = true;
  }

  void toggleAds() {
    state ? removeAds() : showAds();
  }
}
