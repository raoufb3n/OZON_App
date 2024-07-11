import 'package:bloc/bloc.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Auth/data/domain/repos/AuthServiceRepo.dart';
import 'package:flutterstarter/Features/Events/data/domain/repo/EventsRepo.dart';
import 'package:flutterstarter/Features/Events/data/model/event/event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_cubit.freezed.dart';
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventState.initial());

  Future<void> getEvents() async {
    try {
      final events =
          await EventsRepo().getEvents(await AuthServicesRepo.getToken());
      emit(EventState.loaded(events));
    } on HandleError catch (e) {
      HandleError.handle(e.message);
    } catch (e) {
      emit(EventState.error(e.toString()));
    }
  }
}
