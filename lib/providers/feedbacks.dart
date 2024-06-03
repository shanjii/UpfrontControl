// ignore_for_file: file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Feedbacks {
  bool muted;
  FeedbackType? haptic;

  Feedbacks({required this.muted, required this.haptic});

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

  setHaptic(FeedbackType? type) async {
    final prefs = await SharedPreferences.getInstance();
    haptic = type;
    
    if (type == null) {
      await prefs.setString('haptic', "off");
    } else {
      await prefs.setString('haptic', type.name.toString());
    }
  }

  cacheSound() async {
    await AudioPlayer().play(
      AssetSource('click1.ogg'),
      volume: 0,
      mode: PlayerMode.lowLatency,
    );
  }

  tapVibration() {
    if (haptic == null) return;
    Vibrate.feedback(haptic!);
  }

  tapSound() {
    AudioPlayer().play(
      AssetSource('click1.ogg'),
      volume: muted ? 0 : 100,
      mode: PlayerMode.lowLatency,
    );
  }
}
