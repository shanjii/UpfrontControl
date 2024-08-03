import 'package:json_annotation/json_annotation.dart';

part 'connection_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ConnectionModel {
  String ip;
  String port;
  bool virtualJoystick;

  ConnectionModel({this.ip = "", this.port = "", this.virtualJoystick = false});

  Map<String, dynamic> toJson() => _$ConnectionModelToJson(this);

  factory ConnectionModel.fromJson(Map<String, dynamic> map) =>
      _$ConnectionModelFromJson(map);
}
