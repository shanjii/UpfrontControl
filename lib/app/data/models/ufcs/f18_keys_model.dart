import 'package:json_annotation/json_annotation.dart';
import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/data/models/interfaces/ufc_interface.dart';

part 'f18_keys_model.g.dart';

@JsonSerializable(explicitToJson: true)
class F18KeysModel implements Ufc {
  ActionModel num1;

  F18KeysModel({
    required this.num1,
  });

  @override
  Map<String, dynamic> toJson() => _$F18KeysModelToJson(this);

  factory F18KeysModel.fromJson(Map<String, dynamic> map) =>
      _$F18KeysModelFromJson(map);
}
