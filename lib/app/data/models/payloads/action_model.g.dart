// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionModel _$ActionModelFromJson(Map<String, dynamic> json) => ActionModel(
      key: json['key'] as String?,
      modifier: json['modifier'] as String?,
      joyKey: (json['joyKey'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActionModelToJson(ActionModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'modifier': instance.modifier,
      'joyKey': instance.joyKey,
    };
