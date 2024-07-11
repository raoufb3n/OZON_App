import 'package:collection/collection.dart';

import 'datum.dart';

class Post {
  List<Datum>? data;

  Post({this.data});

  @override
  String toString() => 'Post(data: $data)';

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };

  Post copyWith({
    List<Datum>? data,
  }) {
    return Post(
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Post) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => data.hashCode;
}
