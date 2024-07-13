part of 'partcipate_in_event_cubit.dart';

@freezed
class PartcipateInEventState with _$PartcipateInEventState {
  const factory PartcipateInEventState.initial() = _Initial;
  const factory PartcipateInEventState.loading() = _Loading;
  const factory PartcipateInEventState.loaded(String message) = _Loaded;
  const factory PartcipateInEventState.error(String message) = _Error;
}
