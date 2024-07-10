import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterstarter/Core/Helper/ApiServicecs.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Auth/data/domain/services/AuthServices.dart';
import 'package:flutterstarter/Features/Auth/data/model/authusermodel/authusermodel.dart';
import 'package:logger/logger.dart';

import '../../../../../Core/Helper/ApiConstant.dart';

class AuthServicesRepo implements Authservices {
  final ApiService apiService;
  AuthServicesRepo(this.apiService);
  final Logger logger = Logger();
   static const _secureStorage = FlutterSecureStorage();

  @override
  Future<Authusermodel> login(String email, String password)async {
    final reponse =await apiService.post(endPoint: Endpoints.login, query: {
      "email": email,
      "password": password,
    });
    if (reponse.statusCode == 200) {
      logger.i("login success");
      final user=Authusermodel.fromJson(reponse.data);
      return user;
    }else{
      logger.e("login failed");
      throw HandleError.handle(reponse.statusMessage);
    }
  }
    static Future<void> persistData(token) async {
    await _secureStorage.write(key: 'x-auth-token', value: token);
  }

  @override
  Future<Authusermodel> signIn(
      String email, String password, String nom, String prenom) async{
            final reponse =await apiService.post(endPoint: Endpoints.register, query: {
      "email": email,
      "password": password,
      "name": nom,
      "last_name": prenom,
    });
    if (reponse.statusCode == 200) {
      logger.i("register success");
      final user=Authusermodel.fromJson(reponse.data);
      return user;
    }else{
      logger.e("register failed");
      throw HandleError.handle(reponse.statusMessage);
    }
      }
}
