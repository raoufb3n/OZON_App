import 'package:flutterstarter/Core/Helper/ApiConstant.dart';
import 'package:flutterstarter/Core/Helper/ApiServicecs.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Home/data/domain/services/PostServices.dart';
import 'package:flutterstarter/Features/Home/data/model/post/datum.dart';
import 'package:flutterstarter/Features/Home/data/model/post/post.dart';
import 'package:logger/logger.dart';

class Postrepo implements Postservices {
  final ApiService apiService = ApiService();
  Logger logger = Logger();
  @override
  Future<void> createPost(String token, String content, List<String> images,
      int orgnizerId, String type)async {
    final reponse=await apiService.post(endPoint: Endpoints.posts, token: token, query: {
      'content': content,
      'images': images,
      'user_id': orgnizerId,
      'type': type
    });
    if (reponse.statusCode == 200) {
      logger.i('post created suuccesfully');
      final message = reponse.data['message'];
      logger.i(message);
    } else {
      logger.e('post creation failed');
      throw HandleError.handle(reponse.statusCode);
    }
  }

  @override
  Future<List<Datum>> getPosts(String token) async {
    final response =
        await apiService.get(endPoint: Endpoints.posts, token: token);
    if (response.statusCode == 200) {
      logger.i('posts featched suuccesfully');
      final post = Post.fromJson(response.data);
      logger.i(post);
      final posts = post.data;
      logger.i(posts);
      return posts!;
    } else {
      logger.e('posts featched failed');
      throw HandleError.handle(response.statusCode);
    }
  }

  @override
  Future<void> getUniquePost(String token, int postId) {
    // TODO: implement getUniquePost
    throw UnimplementedError();
  }

  @override
  Future<void> participateinPost(String token, int postId) {
    // TODO: implement participateinPost
    throw UnimplementedError();
  }

  @override
  Future<void> postByLocation(String token) {
    // TODO: implement postByLocation
    throw UnimplementedError();
  }

  @override
  Future<void> sharePost(String token) {
    // TODO: implement sharePost
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(
      String token, Datum postModel, int limit, int orgnizerId) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
