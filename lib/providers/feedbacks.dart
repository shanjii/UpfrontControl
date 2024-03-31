// ignore_for_file: file_names

import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soundpool/soundpool.dart';

class Feedbacks {
  bool muted;
  FeedbackType haptic;

  Feedbacks({required this.muted, required this.haptic});

  final Soundpool player = Soundpool.fromOptions(
    options: const SoundpoolOptions(streamType: StreamType.notification),
  );

  late int activeSound;

  mute() async {
    muted = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('muted', true);
  }

  unmute() async {
    muted = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('muted', false);
  }

  setHaptic(FeedbackType type) async {
    haptic = type;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('haptic', type.name.toString());
  }

  initSoundF16() async {
    activeSound = await rootBundle.load("assets/click1.ogg").then(
      (ByteData soundData) {
        return player.load(soundData);
      },
    );
  }

  tapVibration() {
    Vibrate.feedback(haptic);
  }

  tapSound() {
    if (muted) return;
    player.play(activeSound);
  }

  initSoundF18() async {
    // activeSound = await rootBundle.load("assets/click1.ogg").then(
    //   (ByteData soundData) {
    //     return player.load(soundData);
    //   },
    // );
  }
}
