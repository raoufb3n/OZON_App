
import 'package:dio/dio.dart';
export 'package:dio/dio.dart';

/// [DioHelper] is a class that contains all the methods that are used to
/// communicate with the API
///
/// [dio] is the instance of the Dio package
///
/// [init] is used to initialize the Dio package
///
/// [getData] is used to get data from the API
///
/// [postData] is used to post data to the API
///
/// [putData] is used to put data to the API
///
/// [deleteData] is used to delete data from the API
///
///
class DioHelper {
  static late Dio dio;

  /// This method is used to initialize the Dio package
  /// [init] is used to initialize the Dio package
  /// [dio] is the instance of the Dio package
  /// [baseUrl] is the base url of the API
  /// [connectTimeout] is the time to wait for the server to send data
  /// [receiveTimeout] is the time to wait for the server to send data
  /// [receiveDataWhenStatusError] is used to receive data when the status is an error
  /// [validateStatus] is used to validate the status
  /// [contentType] is the type of the content
  /// [responseType] is the type of the response
  ///

  static Dio init() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    return dio;
  }

  /// [getData] is used to get data from the API
  /// [url] is the endpoint of the API
  /// [query] is the query of the API
  /// [token] is the token of the API
  ///
  /// example:
  /// ```dart
  /// return await DioHelper.getData(
  ///    url: "${Endpoints.member}/$id",
  ///    token: token,
  /// );
  ///
  /// ```
  ///

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio.get(url,
        queryParameters: query,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ));
  }

  /// [postData] is used to post data to the API
  /// [url] is the endpoint of the API
  /// [query] is the query of the API
  /// [data] is the data of the API
  /// [token] is the token of the API
  ///
  /// example:
  /// ```dart
  /// return await DioHelper.postData(
  ///  url: Endpoints.login,
  ///  data: {
  ///  'email': email,
  ///  'password': password,
  ///  },
  /// );
  ///
  /// ```

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio.post(url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: {
            'authorization': "Bearer $token",
            "Content-Type": "application/json",
            "Accept-Language": "EN",
          },
        ));
  }

  /// [putData] is used to put data to the API
  /// [url] is the endpoint of the API
  /// [query] is the query of the API
  /// [data] is the data of the API
  /// [token] is the token of the API
  ///
  /// example:
  /// ```dart
  /// return await DioHelper.putData(
  /// url: "${Endpoints.member}/$id",
  /// token: token,
  /// data: {
  /// 'memberName': memberName,
  /// },
  /// );
  /// ```
  ///
  ///

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.put(url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: {
            'authorization': "Bearer $token",
            "Content-Type": "application/json",
            "Accept-Language": "EN",
          },
        ));
  }

  /// [deleteData] is used to delete data from the API
  /// [url] is the endpoint of the API
  /// [query] is the query of the API
  /// [data] is the data of the API
  /// [token] is the token of the API
  ///
  /// example:
  /// ```dart
  /// return await DioHelper.deleteData(
  /// url: "${Endpoints.member}/$id",
  /// token: token,
  /// );
  /// ```
  ///

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
      options: Options(
        headers: {
          'authorization': "Bearer $token",
          "Content-Type": "application/json",
          "Accept-Language": "EN",
        },
      ),
    );
  }
}
//https://project-platform.onrender.com/api/v1/
