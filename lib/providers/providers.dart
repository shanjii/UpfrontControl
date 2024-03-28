import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class Sounds {
  final Soundpool pool = Soundpool.fromOptions(
    options: const SoundpoolOptions(streamType: StreamType.notification),
  );

  late int activeSound;

  initSoundF16() async {
    activeSound = await rootBundle.load("assets/click1.ogg").then(
      (ByteData soundData) {
        return pool.load(soundData);
      },
    );
  }
}

class Tools {
  final bool devMode;

  Tools({this.devMode = false});
}
