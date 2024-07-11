// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      start: json['start'] as String?,
      organizer: json['organizer'] == null
          ? null
          : Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
      eventType: json['event_type'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      eventTypeId: (json['event_type_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      images: json['images'] as List<dynamic>?,
      participations: (json['participations'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'start': instance.start,
      'organizer': instance.organizer,
      'event_type': instance.eventType,
      'limit': instance.limit,
      'event_type_id': instance.eventTypeId,
      'created_at': instance.createdAt?.toIso8601String(),
      'images': instance.images,
      'participations': instance.participations,
    };
