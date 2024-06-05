import 'package:flutter/material.dart';
import 'package:icp_app/app/presenters/communication_presenter.dart';
import 'package:icp_app/app/presenters/feedback_presenter.dart';
import 'package:icp_app/core/values/buttons.dart';
import 'package:provider/provider.dart';

onPress(BuildContext context, {required Keyboard? key}) {
  context.read<FeedbackPresenter>().tapVibration();
  context.read<FeedbackPresenter>().tapSound();
  context.read<CommunicationPresenter>().pressKey(key);
}

onRelease(BuildContext context, {required Keyboard? key}) {
  context.read<FeedbackPresenter>().tapVibration();
  context.read<FeedbackPresenter>().tapSound();
  context.read<CommunicationPresenter>().releaseKey(key);
}

Keyboard? stringToKeyboard(String? string) {
  if (string == "" || string == null) return null;
  for (var key in Keyboard.values) {
    if (key.value == string) {
      return key;
    }
  }
  return null;
}
