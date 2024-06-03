import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/values/buttons.dart';

onPress(Keyboard? value, Feedbacks feedbacks, Communication communication) {
  feedbacks.tapVibration();
  feedbacks.tapSound();
  communication.pressKey(value);
}

onRelease(Keyboard? value, Feedbacks feedbacks, Communication communication) {
  feedbacks.tapVibration();
  feedbacks.tapSound();
  communication.releaseKey(value);
}
