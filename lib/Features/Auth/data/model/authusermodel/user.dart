import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'profile_pic')
  String? profilePic;
  String? email;
  int? certified;
  int? admin;
  @JsonKey(name: 'email_verified_at')
  DateTime? emailVerifiedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.lastName,
    this.profilePic,
    this.email,
    this.certified,
    this.admin,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, lastName: $lastName, profilePic: $profilePic, email: $email, certified: $certified, admin: $admin, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? name,
    String? lastName,
    String? profilePic,
    String? email,
    int? certified,
    int? admin,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      profilePic: profilePic ?? this.profilePic,
      email: email ?? this.email,
      certified: certified ?? this.certified,
      admin: admin ?? this.admin,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      lastName.hashCode ^
      profilePic.hashCode ^
      email.hashCode ^
      certified.hashCode ^
      admin.hashCode ^
      emailVerifiedAt.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
