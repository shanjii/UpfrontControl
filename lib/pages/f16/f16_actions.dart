import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/providers/network.dart';
import 'package:icp_app/values/buttons.dart';

class F16Actions {
  final Feedbacks feedbacks;
  final Network network;

  F16Actions({required this.feedbacks, required this.network});

  onPress(Keyboard? value) {
    feedbacks.tapVibration();
    feedbacks.tapSound();
    if (value != null) network.pressKey(value);
  }

  onRelease(Keyboard? value) {
    feedbacks.tapVibration();
    feedbacks.tapSound();
    if (value != null) network.releaseKey(value);
  }
}
