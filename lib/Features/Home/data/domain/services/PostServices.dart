

import 'package:flutterstarter/Features/Home/data/model/post/datum.dart';

abstract class Postservices{
  Future<void> getPosts(String token);
  Future<void> getUniquePost(String token, int postId);
  Future<void> createPost(
      String token, String content, List<String> images, int orgnizerId,String type);
  Future<void> updatePost(
      String token, Datum postModel, int limit, int orgnizerId);
  Future<void> postByLocation(String token);
  Future<void> participateinPost(String token, int postId);
  Future<void> sharePost(String token);

}