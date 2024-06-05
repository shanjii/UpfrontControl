import 'dart:convert';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:icp_app/data/models/f16_keys_model.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSettings {
  final SharedPreferences prefs;

  LocalSettings(this.prefs);

  Future<String> getSavedIp() async {
    return prefs.getString('ip') ?? "";
  }

  Future<String> getSavedPort() async {
    return prefs.getString('port') ?? "5551";
  }

  Future<bool> getMutedSetting() async {
    return prefs.getBool('muted') ?? false;
  }

  Future<bool> getActivitySetting() async {
    return prefs.getBool('manage-activity') ?? false;
  }

  Future<FeedbackType?> getHapticSetting() async {
    var value = prefs.getString("haptic");
    if (value == null) {
      return FeedbackType.medium;
    } else if (value == "off") {
      return null;
    } else {
      return FeedbackType.values.byName(value);
    }
  }

  Future<F16KeysModel> getF16Keybinds() async {
    var value = prefs.getString('f16Keys');

    if (value != null) {
      return F16KeysModel.fromJson(jsonDecode(value));
    }

    return F16KeysModel(
      com1: Keyboard.D0,
      com2: Keyboard.D1,
      iff: Keyboard.D3,
      list: Keyboard.D4,
      aa: Keyboard.D5,
      ag: Keyboard.D6,
      num0: Keyboard.NumPad0,
      num1: Keyboard.NumPad1,
      num2: Keyboard.NumPad2,
      num3: Keyboard.NumPad3,
      num4: Keyboard.NumPad4,
      num5: Keyboard.NumPad5,
      num6: Keyboard.NumPad6,
      num7: Keyboard.NumPad7,
      num8: Keyboard.NumPad8,
      num9: Keyboard.NumPad9,
      entr: Keyboard.Enter,
      rcl: Keyboard.Backspace,
      flirUp: Keyboard.Add,
      flirDown: Keyboard.Subtract,
      drift: Keyboard.J,
      norm: Keyboard.K,
      warnReset: Keyboard.L,
      wx: Keyboard.Multiply,
      dobberDown: Keyboard.Down,
      dobberLeft: Keyboard.Left,
      dobberRight: Keyboard.Right,
      dobberUp: Keyboard.Up,
    );
  }
}
