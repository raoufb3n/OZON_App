import 'package:bloc/bloc.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Auth/data/domain/repos/AuthServiceRepo.dart';
import 'package:flutterstarter/Features/Events/data/domain/repo/EventsRepo.dart';
import 'package:flutterstarter/Features/Events/data/model/event/datum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_cubit.freezed.dart';
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(const EventState.initial());

  Future<void> getEvents() async {
    try {
      emit(const EventState.loading());
      final token = await AuthServicesRepo.getToken();
      if (token != null) {
        final events = await EventsRepo().getEvents(token);
        emit(EventState.loaded(events!));
      } else {
        emit(EventState.error('Token is null'));
      }
    } on HandleError catch (e) {
      emit(EventState.error(HandleError.handle(e.message).message));
    } catch (e) {
      emit(EventState.error(e.toString()));
    }
  }
}
