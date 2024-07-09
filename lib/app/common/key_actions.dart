import 'package:ufc_app/core/enums/keyboard.dart';

stringToKeyname(String string) {
  for (var key in KeyboardAll.values) {
    if (key.value == string) {
      return key.name;
    }
  }
}
