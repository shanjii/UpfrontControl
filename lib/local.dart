import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSettings {
  final SharedPreferences prefs;

  LocalSettings(this.prefs);

  getSavedIp() async {
    return prefs.getString('ip') ?? "";
  }

  getSavedPort() async {
    return prefs.getString('port') ?? "5551";
  }

  getMutedSetting() async {
    return prefs.getBool('muted') ?? false;
  }

  getActivitySetting() async {
    return prefs.getBool('manage-activity') ?? false;
  }

  getHapticSetting() async {
    var value = prefs.getString("haptic");
    if (value != null) {
      return FeedbackType.values.byName(value);
    } else {
      return FeedbackType.medium;
    }
  }
}
