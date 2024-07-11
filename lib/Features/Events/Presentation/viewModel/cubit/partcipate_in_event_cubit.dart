import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../Auth/data/domain/repos/AuthServiceRepo.dart';
import '../../../data/domain/repo/EventsRepo.dart';

part 'partcipate_in_event_state.dart';
part 'partcipate_in_event_cubit.freezed.dart';

class PartcipateInEventCubit extends Cubit<PartcipateInEventState> {
  PartcipateInEventCubit() : super(PartcipateInEventState.initial());

  void participateInEvent(int eventId) async {
    emit(PartcipateInEventState.loading());
    try {
      final token = await AuthServicesRepo.getToken();
      if (token != null) {
        final events = await EventsRepo().participateinEvent(token, eventId);
        print(events);
        emit(PartcipateInEventState.loaded(events));
      } else {
        emit(PartcipateInEventState.error('Token is null'));
      }
    } catch (e) {
      emit(PartcipateInEventState.error(e.toString()));
    }
  }
}
