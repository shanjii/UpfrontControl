import 'package:flutter/material.dart';
import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:provider/provider.dart';

onPress(BuildContext context, {required Keyboard? key}) {
  context.read<Feedbacks>().tapVibration();
  context.read<Feedbacks>().tapSound();
  context.read<Communication>().pressKey(key);
}

onRelease(BuildContext context, {required Keyboard? key}) {
  context.read<Feedbacks>().tapVibration();
  context.read<Feedbacks>().tapSound();
  context.read<Communication>().releaseKey(key);
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
