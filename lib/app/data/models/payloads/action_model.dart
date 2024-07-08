import 'package:json_annotation/json_annotation.dart';

part 'action_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ActionModel {
  String? key;
  String? modifier;
  int? joyKey;

  ActionModel({
    required this.key,
    required this.modifier,
    required this.joyKey,
  });

  Map<String, dynamic> toJson() => _$ActionModelToJson(this);

  factory ActionModel.fromJson(Map<String, dynamic> map) =>
      _$ActionModelFromJson(map);
}
