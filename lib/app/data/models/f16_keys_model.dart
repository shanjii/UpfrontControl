import 'package:icp_app/app/common/key_actions.dart';
import 'package:icp_app/core/values/buttons.dart';

class F16KeysModel {
  Keyboard? com1;
  Keyboard? com2;
  Keyboard? iff;
  Keyboard? list;
  Keyboard? aa;
  Keyboard? ag;

  Keyboard? num0;
  Keyboard? num1;
  Keyboard? num2;
  Keyboard? num3;
  Keyboard? num4;
  Keyboard? num5;
  Keyboard? num6;
  Keyboard? num7;
  Keyboard? num8;
  Keyboard? num9;
  Keyboard? entr;
  Keyboard? rcl;

  Keyboard? flirUp;
  Keyboard? flirDown;
  Keyboard? drift;
  Keyboard? norm;
  Keyboard? warnReset;
  Keyboard? wx;

  Keyboard? dobberUp;
  Keyboard? dobberLeft;
  Keyboard? dobberDown;
  Keyboard? dobberRight;
  Keyboard? stepUp;
  Keyboard? stepDown;

  F16KeysModel({
    this.com1,
    this.com2,
    this.iff,
    this.list,
    this.aa,
    this.ag,
    this.num0,
    this.num1,
    this.num2,
    this.num3,
    this.num4,
    this.num5,
    this.num6,
    this.num7,
    this.num8,
    this.num9,
    this.entr,
    this.rcl,
    this.flirUp,
    this.flirDown,
    this.drift,
    this.norm,
    this.warnReset,
    this.wx,
    this.dobberUp,
    this.dobberLeft,
    this.dobberDown,
    this.dobberRight,
    this.stepUp,
    this.stepDown,
  });

  factory F16KeysModel.fromJson(Map<String, dynamic> parsedJson) {
    return F16KeysModel(
      com1: stringToKeyboard(parsedJson['com1']),
      com2: stringToKeyboard(parsedJson['com2']),
      iff: stringToKeyboard(parsedJson['iff']),
      list: stringToKeyboard(parsedJson['list']),
      aa: stringToKeyboard(parsedJson['aa']),
      ag: stringToKeyboard(parsedJson['ag']),
      num0: stringToKeyboard(parsedJson['num0']),
      num1: stringToKeyboard(parsedJson['num1']),
      num2: stringToKeyboard(parsedJson['num2']),
      num3: stringToKeyboard(parsedJson['num3']),
      num4: stringToKeyboard(parsedJson['num4']),
      num5: stringToKeyboard(parsedJson['num5']),
      num6: stringToKeyboard(parsedJson['num6']),
      num7: stringToKeyboard(parsedJson['num7']),
      num8: stringToKeyboard(parsedJson['num8']),
      num9: stringToKeyboard(parsedJson['num9']),
      entr: stringToKeyboard(parsedJson['entr']),
      rcl: stringToKeyboard(parsedJson['rcl']),
      flirUp: stringToKeyboard(parsedJson['flirUp']),
      flirDown: stringToKeyboard(parsedJson['flirDown']),
      drift: stringToKeyboard(parsedJson['drift']),
      norm: stringToKeyboard(parsedJson['norm']),
      warnReset: stringToKeyboard(parsedJson['warnReset']),
      wx: stringToKeyboard(parsedJson['wx']),
      dobberDown: stringToKeyboard(parsedJson['dobberDown']),
      dobberLeft: stringToKeyboard(parsedJson['dobberLeft']),
      dobberRight: stringToKeyboard(parsedJson['dobberRight']),
      dobberUp: stringToKeyboard(parsedJson['dobberUp']),
    );
  }

  Map<String, String> toJson() {
    return {
      'com1': com1?.value ?? "",
      'com2': com2?.value ?? "",
      'iff': iff?.value ?? "",
      'list': list?.value ?? "",
      'aa': aa?.value ?? "",
      'ag': ag?.value ?? "",
      'num1': num1?.value ?? "",
      'num2': num2?.value ?? "",
      'num3': num3?.value ?? "",
      'num4': num4?.value ?? "",
      'num5': num5?.value ?? "",
      'num6': num6?.value ?? "",
      'num7': num7?.value ?? "",
      'num8': num8?.value ?? "",
      'num9': num9?.value ?? "",
      'num0': num0?.value ?? "",
      'entr': entr?.value ?? "",
      'rcl': rcl?.value ?? "",
      'flirUp': flirUp?.value ?? "",
      'flirDown': flirDown?.value ?? "",
      'drift': drift?.value ?? "",
      'norm': norm?.value ?? "",
      'warnReset': warnReset?.value ?? "",
      'wx': wx?.value ?? "",
      'dobberDown': dobberDown?.value ?? "",
      'dobberLeft': dobberLeft?.value ?? "",
      'dobberRight': dobberRight?.value ?? "",
      'dobberUp': dobberUp?.value ?? "",
    };
  }
}
