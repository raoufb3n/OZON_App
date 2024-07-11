import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'authusermodel.g.dart';

@JsonSerializable()
class Authusermodel {
  User? user;
  String? token;

  Authusermodel({this.user, this.token});

  @override
  String toString() => 'Authusermodel(user: $user, token: $token)';

  factory Authusermodel.fromJson(Map<String, dynamic> json) {
    return _$AuthusermodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthusermodelToJson(this);

  Authusermodel copyWith({
    User? user,
    String? token,
  }) {
    return Authusermodel(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Authusermodel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}
