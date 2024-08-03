import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:ufc_app/app/data/datasources/local/settings_datasource.dart';
import 'package:ufc_app/core/sounds/sounds.dart';

class FeedbackProvider {
  FeedbackProvider() {
    _init();
  }

  late bool muted;
  late FeedbackType? haptic;
  late Sounds sounds;

  final SettingsDatasource settingsDatasource = SettingsDatasource();

  _init() async {
    sounds = await settingsDatasource.loadSounds();
    haptic = await settingsDatasource.getHaptic();
    muted = await settingsDatasource.getSound();
  }

  tapVibration() {
    if (haptic == null) return;
    Vibrate.feedback(haptic!);
  }

  tapSound() {
    sounds.playClick();
  }
}
