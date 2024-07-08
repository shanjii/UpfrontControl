import 'package:icp_app/core/values/buttons.dart';

stringToKeyname(String string) {
  for (var key in Keyboard.values) {
    if (key.value == string) {
      return key.name;
    }
  }
}
