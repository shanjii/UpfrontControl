// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionModel _$ConnectionModelFromJson(Map<String, dynamic> json) =>
    ConnectionModel(
      ip: json['ip'] as String? ?? "",
      port: json['port'] as String? ?? "",
      virtualJoystick: json['virtualJoystick'] as bool? ?? false,
    );

Map<String, dynamic> _$ConnectionModelToJson(ConnectionModel instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'port': instance.port,
      'virtualJoystick': instance.virtualJoystick,
    };
