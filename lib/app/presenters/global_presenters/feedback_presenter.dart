import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class FeedbackPresenter {
  bool muted;
  FeedbackType? haptic;

  FeedbackPresenter({required this.muted, required this.haptic});

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
