import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organizer.g.dart';

@JsonSerializable()
class Organizer {
  String? name;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'profile_pic')
  String? profilePic;

  Organizer({this.name, this.lastName, this.profilePic});

  @override
  String toString() {
    return 'Organizer(name: $name, lastName: $lastName, profilePic: $profilePic)';
  }

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return _$OrganizerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrganizerToJson(this);

  Organizer copyWith({
    String? name,
    String? lastName,
    String? profilePic,
  }) {
    return Organizer(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Organizer) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => name.hashCode ^ lastName.hashCode ^ profilePic.hashCode;
}
