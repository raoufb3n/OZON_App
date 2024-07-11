import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'organizer.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? description;
  String? address;
  double? longitude;
  double? latitude;
  String? start;
  Organizer? organizer;
  @JsonKey(name: 'event_type')
  String? eventType;
  int? limit;
  @JsonKey(name: 'event_type_id')
  int? eventTypeId;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  List<dynamic>? images;
  int? participations;

  Data({
    this.id,
    this.name,
    this.description,
    this.address,
    this.longitude,
    this.latitude,
    this.start,
    this.organizer,
    this.eventType,
    this.limit,
    this.eventTypeId,
    this.createdAt,
    this.images,
    this.participations,
  });

  @override
  String toString() {
    return 'Data(id: $id, name: $name, description: $description, address: $address, longitude: $longitude, latitude: $latitude, start: $start, organizer: $organizer, eventType: $eventType, limit: $limit, eventTypeId: $eventTypeId, createdAt: $createdAt, images: $images, participations: $participations)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? id,
    String? name,
    String? description,
    String? address,
    double? longitude,
    double? latitude,
    String? start,
    Organizer? organizer,
    String? eventType,
    int? limit,
    int? eventTypeId,
    DateTime? createdAt,
    List<dynamic>? images,
    int? participations,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      start: start ?? this.start,
      organizer: organizer ?? this.organizer,
      eventType: eventType ?? this.eventType,
      limit: limit ?? this.limit,
      eventTypeId: eventTypeId ?? this.eventTypeId,
      createdAt: createdAt ?? this.createdAt,
      images: images ?? this.images,
      participations: participations ?? this.participations,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      address.hashCode ^
      longitude.hashCode ^
      latitude.hashCode ^
      start.hashCode ^
      organizer.hashCode ^
      eventType.hashCode ^
      limit.hashCode ^
      eventTypeId.hashCode ^
      createdAt.hashCode ^
      images.hashCode ^
      participations.hashCode;
}
