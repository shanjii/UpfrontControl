import 'package:icp_app/app/data/models/payloads/action_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'f16_keys_model.g.dart';

@JsonSerializable(explicitToJson: true)
class F16KeysModel {
  ActionModel com1;
  ActionModel com2;
  ActionModel iff;
  ActionModel list;
  ActionModel aa;
  ActionModel ag;

  ActionModel num0;
  ActionModel num1;
  ActionModel num2;
  ActionModel num3;
  ActionModel num4;
  ActionModel num5;
  ActionModel num6;
  ActionModel num7;
  ActionModel num8;
  ActionModel num9;
  ActionModel entr;
  ActionModel rcl;

  ActionModel flirUp;
  ActionModel flirDown;
  ActionModel drift;
  ActionModel norm;
  ActionModel warnReset;
  ActionModel wx;

  ActionModel dobberUp;
  ActionModel dobberLeft;
  ActionModel dobberDown;
  ActionModel dobberRight;
  ActionModel stepUp;
  ActionModel stepDown;

  F16KeysModel({
    required this.com1,
    required this.com2,
    required this.iff,
    required this.list,
    required this.aa,
    required this.ag,
    required this.num0,
    required this.num1,
    required this.num2,
    required this.num3,
    required this.num4,
    required this.num5,
    required this.num6,
    required this.num7,
    required this.num8,
    required this.num9,
    required this.entr,
    required this.rcl,
    required this.flirUp,
    required this.flirDown,
    required this.drift,
    required this.norm,
    required this.warnReset,
    required this.wx,
    required this.dobberUp,
    required this.dobberLeft,
    required this.dobberDown,
    required this.dobberRight,
    required this.stepUp,
    required this.stepDown,
  });

  Map<String, dynamic> toJson() => _$F16KeysModelToJson(this);

  factory F16KeysModel.fromJson(Map<String, dynamic> map) =>
      _$F16KeysModelFromJson(map);
}
