import 'package:flutterstarter/Core/Helper/DioHelper.dart';

class ApiService {
  ApiService();

  Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? query,
      String? token}) async {
    final response = await DioHelper.getData(url: endPoint, token: token);
    return response;
  }

  Future<Response> post(
      {required String endPoint,
      Map<String, dynamic>? query,
      String? token}) async {
    final response = await DioHelper.postData(url: endPoint, data: query!);
    return response;
  }

  Future<Response> put(
      {required String endPoint,
      Map<String, dynamic>? query,
      String? token}) async {
    final response = await DioHelper.putData(url: endPoint, data: query);
    return response;
  }

  Future<Response> delete(
      {required String endPoint, Map<String, dynamic>? query}) async {
    final response = await DioHelper.deleteData(url: endPoint);
    return response;
  }
}
