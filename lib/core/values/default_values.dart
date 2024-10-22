import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/data/models/connection_model.dart';
import 'package:ufc_app/app/data/models/ufcs/f16_keys_model.dart';
import 'package:ufc_app/app/data/models/ufcs/f18_keys_model.dart';

class DefaultValues {
  static connection() {
    return ConnectionModel(
      ip: "",
      port: "5551",
      virtualJoystick: false,
    );
  }

  static f16Keys() {
    return F16KeysModel(
      com1: ActionModel(key: null, modifier: null, joyKey: 1),
      com2: ActionModel(key: null, modifier: null, joyKey: 2),
      iff: ActionModel(key: null, modifier: null, joyKey: 3),
      list: ActionModel(key: null, modifier: null, joyKey: 4),
      aa: ActionModel(key: null, modifier: null, joyKey: 5),
      ag: ActionModel(key: null, modifier: null, joyKey: 6),
      num0: ActionModel(key: null, modifier: null, joyKey: 7),
      num1: ActionModel(key: null, modifier: null, joyKey: 8),
      num2: ActionModel(key: null, modifier: null, joyKey: 9),
      num3: ActionModel(key: null, modifier: null, joyKey: 10),
      num4: ActionModel(key: null, modifier: null, joyKey: 11),
      num5: ActionModel(key: null, modifier: null, joyKey: 12),
      num6: ActionModel(key: null, modifier: null, joyKey: 13),
      num7: ActionModel(key: null, modifier: null, joyKey: 14),
      num8: ActionModel(key: null, modifier: null, joyKey: 15),
      num9: ActionModel(key: null, modifier: null, joyKey: 16),
      entr: ActionModel(key: null, modifier: null, joyKey: 17),
      rcl: ActionModel(key: null, modifier: null, joyKey: 18),
      flirUp: ActionModel(key: null, modifier: null, joyKey: 19),
      flirDown: ActionModel(key: null, modifier: null, joyKey: 20),
      drift: ActionModel(key: null, modifier: null, joyKey: 21),
      norm: ActionModel(key: null, modifier: null, joyKey: 22),
      warnReset: ActionModel(key: null, modifier: null, joyKey: 23),
      wx: ActionModel(key: null, modifier: null, joyKey: 24),
      dobberLeft: ActionModel(key: null, modifier: null, joyKey: 25),
      dobberUp: ActionModel(key: null, modifier: null, joyKey: 26),
      dobberDown: ActionModel(key: null, modifier: null, joyKey: 27),
      dobberRight: ActionModel(key: null, modifier: null, joyKey: 28),
      stepUp: ActionModel(key: null, modifier: null, joyKey: 29),
      stepDown: ActionModel(key: null, modifier: null, joyKey: 30),
    );
  }

  static f18Keys() {
    return F18KeysModel(
      num1: ActionModel(key: null, modifier: null, joyKey: 1),
    );
  }
}
