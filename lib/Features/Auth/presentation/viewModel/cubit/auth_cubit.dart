import 'package:bloc/bloc.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Auth/data/domain/repos/AuthServiceRepo.dart';
import 'package:flutterstarter/Features/Auth/data/model/authusermodel/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  void register(
      String email, String password, String name, String lastName) async {
    emit(const AuthState.loading());
    try {
      final user =
          await AuthServicesRepo().signIn(email, password, name, lastName);
      AuthServicesRepo.persistData(user.token);

      emit(AuthState.loaded(user.user!));
    } on HandleError catch (e) {
      emit(AuthState.error(e.toString()));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  void login(
    String email,
    String password,
  ) async {
    emit(const AuthState.loading());
    try {
      final user = await AuthServicesRepo().login(email, password);
      AuthServicesRepo.persistData(user.token);
      emit(AuthState.loaded(user.user!));
    } on HandleError catch (e) {
      emit(AuthState.error(e.toString()));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
