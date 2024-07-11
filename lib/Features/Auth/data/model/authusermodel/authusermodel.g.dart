// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authusermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authusermodel _$AuthusermodelFromJson(Map<String, dynamic> json) =>
    Authusermodel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthusermodelToJson(Authusermodel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
