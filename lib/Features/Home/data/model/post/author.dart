import 'package:collection/collection.dart';

import 'grade.dart';

class Author {
  String? name;
  String? lastName;
  String? profilePic;
  Grade? grade;

  Author({this.name, this.lastName, this.profilePic, this.grade});

  @override
  String toString() {
    return 'Author(name: $name, lastName: $lastName, profilePic: $profilePic, grade: $grade)';
  }

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json['name'] as String?,
        lastName: json['last_name'] as String?,
        profilePic: json['profile_pic'] as String?,
        grade: json['grade'] == null
            ? null
            : Grade.fromJson(json['grade'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'last_name': lastName,
        'profile_pic': profilePic,
        'grade': grade?.toJson(),
      };

  Author copyWith({
    String? name,
    String? lastName,
    String? profilePic,
    Grade? grade,
  }) {
    return Author(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      profilePic: profilePic ?? this.profilePic,
      grade: grade ?? this.grade,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Author) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      name.hashCode ^ lastName.hashCode ^ profilePic.hashCode ^ grade.hashCode;
}
