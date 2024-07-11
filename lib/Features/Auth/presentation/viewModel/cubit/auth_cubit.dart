import 'package:bloc/bloc.dart';
import 'package:flutterstarter/Core/Helper/ApiServicecs.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Auth/data/domain/repos/AuthServiceRepo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());
  final ApiService apiService = ApiService();


  void register(
      String email, String password, String name, String lastName) async {
    emit(const AuthState.loading());
    try {
      final user = await AuthServicesRepo(apiService)
          .signIn(email, password, name, lastName);
      AuthServicesRepo.persistData(user.token);
      print(AuthServicesRepo.getToken());

      emit(AuthState.loaded());
    } on HandleError catch (e) {
      emit(AuthState.error(e.toString()));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
  void login(
      String email, String password,) async {
    emit(const AuthState.loading());
    try {
      final user = await AuthServicesRepo(apiService)
          .login(email, password);
      AuthServicesRepo.persistData(user.token);
      emit(AuthState.loaded());
    } on HandleError catch (e) {
      emit(AuthState.error(e.toString()));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }  
}
