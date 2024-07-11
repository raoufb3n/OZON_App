part of 'started_app_cubit.dart';

@freezed
abstract class StartedAppState with _$StartedAppState {
  const factory StartedAppState.initial() = StartedAppInitial;
  const factory StartedAppState.loading() = StartedAppLoading;
  const factory StartedAppState.unothanticated() = Unothanticated;
  const factory StartedAppState.authenticated(User? user) = Authenticated;
  const factory StartedAppState.error(String message) = StartedAppError;
}
