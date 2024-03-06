import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class AudioProvider {
  final Soundpool pool = Soundpool(streamType: StreamType.notification);
  late int activeSound;
  initSoundF16() async {
    activeSound = await rootBundle.load("assets/click1.ogg").then(
      (ByteData soundData) {
        return pool.load(soundData);
      },
    );
  }
}
