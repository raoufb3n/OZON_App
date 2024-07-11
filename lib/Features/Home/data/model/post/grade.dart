import 'package:collection/collection.dart';

class Grade {
  String? grade;
  String? emoji;

  Grade({this.grade, this.emoji});

  @override
  String toString() => 'Grade(grade: $grade, emoji: $emoji)';

  factory Grade.fromJson(Map<String, dynamic> json) => Grade(
        grade: json['grade'] as String?,
        emoji: json['emoji'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'grade': grade,
        'emoji': emoji,
      };

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
