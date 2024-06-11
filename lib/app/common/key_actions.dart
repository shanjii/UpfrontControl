import 'package:icp_app/core/values/buttons.dart';

Keyboard? stringToKeyboard(String? string) {
  if (string == "" || string == null) return null;
  for (var key in Keyboard.values) {
    if (key.value == string) {
      return key;
    }
  }
  return null;
}
