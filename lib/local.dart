import 'dart:convert';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:icp_app/data/models/f16_keys_model.dart';
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
    var jsonString = prefs.getString('f16Keys');
    return F16KeysModel.fromJson(jsonDecode(jsonString!));
  }
}
