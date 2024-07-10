import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:ufc_app/core/sounds/sounds.dart';

class FeedbackPresenter {
  FeedbackPresenter({
    required this.muted,
    required this.haptic,
    required this.sounds,
  });

  bool muted;
  FeedbackType? haptic;
  Sounds sounds;

  tapVibration() {
    if (haptic == null) return;
    Vibrate.feedback(haptic!);
  }

  tapSound() {
    sounds.playClick();
  }
}
