import 'package:collection/collection.dart';

import 'author.dart';

class Datum {
  int? id;
  Author? author;
  String? content;
  int? reposts;
  int? likeCount;
  int? commentsCount;
  List<dynamic> images;
  String? type;
  DateTime? createdAt;
  bool? liked;

  Datum({
    this.id,
    this.author,
    this.content,
    this.reposts,
    this.likeCount,
    this.commentsCount,
    required this.images,
    this.type,
    this.createdAt,
    this.liked,
  });

  @override
  String toString() {
    return 'Datum(id: $id, author: $author, content: $content, reposts: $reposts, likeCount: $likeCount, commentsCount: $commentsCount, images: $images, type: $type, createdAt: $createdAt, liked: $liked)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        author: json['author'] == null
            ? null
            : Author.fromJson(json['author'] as Map<String, dynamic>),
        content: json['content'] as String?,
        reposts: json['reposts'] as int?,
        likeCount: json['like_count'] as int?,
        commentsCount: json['comments_count'] as int?,
        images: json['images'] as List<dynamic>,
        type: json['type'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        liked: json['liked'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author?.toJson(),
        'content': content,
        'reposts': reposts,
        'like_count': likeCount,
        'comments_count': commentsCount,
        'images': images,
        'type': type,
        'created_at': createdAt?.toIso8601String(),
        'liked': liked,
      };

  Datum copyWith({
    int? id,
    Author? author,
    String? content,
    int? reposts,
    int? likeCount,
    int? commentsCount,
    List<String>? images,
    String? type,
    DateTime? createdAt,
    bool? liked,
  }) {
    return Datum(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      reposts: reposts ?? this.reposts,
      likeCount: likeCount ?? this.likeCount,
      commentsCount: commentsCount ?? this.commentsCount,
      images: images ?? this.images,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      liked: liked ?? this.liked,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      author.hashCode ^
      content.hashCode ^
      reposts.hashCode ^
      likeCount.hashCode ^
      commentsCount.hashCode ^
      images.hashCode ^
      type.hashCode ^
      createdAt.hashCode ^
      liked.hashCode;
}
