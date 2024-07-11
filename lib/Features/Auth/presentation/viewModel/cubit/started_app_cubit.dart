import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstarter/Core/Helper/ApiServicecs.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Auth/data/domain/repos/AuthServiceRepo.dart';
import 'package:flutterstarter/Features/Auth/data/model/authusermodel/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'started_app_cubit.freezed.dart';
part 'started_app_state.dart';

class StartedAppCubit extends Cubit<StartedAppState> {
  StartedAppCubit() : super(StartedAppState.initial());
  final ApiService apiService = ApiService();
  void onAppStarted() async {
    emit(const StartedAppState.loading());
    try {
      final token = await AuthServicesRepo.readData('x-auth-token');
      if (token != null) {
        final user = await AuthServicesRepo(apiService).getUser(token);
        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(const Unothanticated());
        }
      }
    } catch (e) {
      HandleError.handle(e.toString());
    }
  }
}
