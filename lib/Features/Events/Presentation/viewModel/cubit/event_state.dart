part of 'event_cubit.dart';

@freezed
class EventState with _$EventState {
  const factory EventState.initial() = _Initial;
  const factory EventState.loading() = _Loading;
  const factory EventState.loaded(List<Datum> events) = _Loaded;
  const factory EventState.error(String message) = _Error;
}
