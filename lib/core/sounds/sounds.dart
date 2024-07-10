import 'package:soundpool/soundpool.dart';

class Sounds {
  Sounds({
    required this.clickSound,
    required this.pool,
  });

  Soundpool pool;
  int clickSound;

  playClick() {
    pool.play(clickSound);
  }
}
