import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterstarter/Core/Helper/ApiServicecs.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Auth/data/domain/services/AuthServices.dart';
import 'package:flutterstarter/Features/Auth/data/model/authusermodel/authusermodel.dart';
import 'package:flutterstarter/Features/Auth/data/model/authusermodel/user.dart';
import 'package:logger/logger.dart';

import '../../../../../Core/Helper/ApiConstant.dart';

class AuthServicesRepo implements Authservices {
  final ApiService apiService;
  AuthServicesRepo(this.apiService);
  final Logger logger = Logger();
  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static const _secureStorage =
      FlutterSecureStorage(aOptions: AndroidOptions.defaultOptions);

  @override
  Future<Authusermodel> login(String email, String password) async {
    final reponse = await apiService.post(endPoint: Endpoints.login, query: {
      "email": email,
      "password": password,
    });
    if (reponse.statusCode == 200) {
      logger.i("login success");
      final user = Authusermodel.fromJson(reponse.data);
      return user;
    } else {
      logger.e("login failed");
      throw HandleError.handle(reponse.statusMessage);
    }
  }

  static Future<void> persistData(token) async {
    await _secureStorage.write(key: 'x-auth-token', value: token);
  }

  static Future<String?> getToken() async {
    final token = await _secureStorage.read(key: 'x-auth-token');
    return token;
  }

  @override
  Future<Authusermodel> signIn(
      String email, String password, String nom, String prenom) async {
    final reponse = await apiService.post(endPoint: Endpoints.register, query: {
      "email": email,
      "password": password,
      "name": nom,
      "last_name": prenom,
    });
    print(reponse.data);
    if (reponse.statusCode == 200) {
      logger.e("register success");
      print(reponse.data);
      final user = Authusermodel.fromJson(reponse.data);
      return user;
    } else {
      logger.e("register failed");
      throw HandleError.handle(reponse.statusMessage);
    }
  }

  @override
  Future<User?> getUser(String token) async {
    final reponse = await apiService.get(
      endPoint: Endpoints.user,
      token: token,
    );
    if (reponse.statusCode == 200) {
      logger.i("get user success");
      logger.i(reponse.data);
      final user = User.fromJson(reponse.data);
      logger.i(user);
      return user;
    } else {
      logger.e("get user failed");
      throw HandleError.handle(reponse.statusMessage);
    }
  }
}
