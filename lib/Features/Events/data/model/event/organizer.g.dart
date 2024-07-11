// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organizer _$OrganizerFromJson(Map<String, dynamic> json) => Organizer(
      name: json['name'] as String?,
      lastName: json['last_name'] as String?,
      profilePic: json['profile_pic'] as String?,
    );

Map<String, dynamic> _$OrganizerToJson(Organizer instance) => <String, dynamic>{
      'name': instance.name,
      'last_name': instance.lastName,
      'profile_pic': instance.profilePic,
    };
