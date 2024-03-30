import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:soundpool/soundpool.dart';

class Feedbacks {
  bool muted;
  FeedbackType hapticFeedback;

  Feedbacks({required this.muted, required this.hapticFeedback});

  final Soundpool player = Soundpool.fromOptions(
    options: const SoundpoolOptions(streamType: StreamType.notification),
  );

  late int activeSound;

  initSoundF16() async {
    activeSound = await rootBundle.load("assets/click1.ogg").then(
      (ByteData soundData) {
        return player.load(soundData);
      },
    );
  }

  tapVibration() {
    Vibrate.feedback(hapticFeedback);
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
