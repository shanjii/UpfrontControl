import 'package:ufc_app/core/enums/keyboard.dart';

stringToKey(String string) {
  for (var key in KeyboardKeys.values) {
    if (key.value == string) {
      return key.name;
    }
  }
}

stringToModifier(String string) {
  for (var key in KeyboardModifiers.values) {
    if (key.value == string) {
      return key.name;
    }
  }
}
