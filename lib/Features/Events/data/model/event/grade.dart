import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grade.g.dart';

@JsonSerializable()
class Grade {
  String? grade;
  String? emoji;

  Grade({this.grade, this.emoji});

  @override
  String toString() => 'Grade(grade: $grade, emoji: $emoji)';

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

  Map<String, dynamic> toJson() => _$GradeToJson(this);

  Grade copyWith({
    String? grade,
    String? emoji,
  }) {
    return Grade(
      grade: grade ?? this.grade,
      emoji: emoji ?? this.emoji,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Grade) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => grade.hashCode ^ emoji.hashCode;
}
