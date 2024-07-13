import 'package:flutterstarter/Core/Helper/ApiConstant.dart';
import 'package:flutterstarter/Core/Helper/ApiServicecs.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Events/data/domain/service/EventService.dart';
import 'package:flutterstarter/Features/Events/data/model/event/event.dart';
import 'package:logger/logger.dart';

import '../../model/event/datum.dart';

class EventsRepo implements EventService {
  final ApiService apiService = ApiService();
  final Logger logger = Logger();
  List<Datum> events = [];

  @override
  Future<void> createEvent(
      String token, Datum eventModel, int limit, int orgnizerId) {
    // TODO: implement CreateEvent
    throw UnimplementedError();
  }

  @override
  Future<void> eventByLocation(String token) {
    // TODO: implement EventByLocation
    throw UnimplementedError();
  }

  @override
  Future<String> participateinEvent(String token, int eventId) async {
    final reponse = await apiService.post(
        endPoint: '${Endpoints.events}/${eventId}/participate', token: token);
    if (reponse.statusCode == 200) {
      logger.e("participate success");
      final message = reponse.data['message'];

      return message;
    } else {
      logger.e("fetching participate failed");
      throw HandleError.handle(reponse.statusMessage);
    }
  }

  @override
  Future<void> shareEvent(String token) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateEvent(
      String token, Datum eventModel, int limit, int orgnizerId) {
    // TODO: implement UpdateEvent
    throw UnimplementedError();
  }

  @override
  Future<void> userParticpations(String token, int eventId) {
    // TODO: implement UserParticpations
    throw UnimplementedError();
  }

  @override
  Future<void> validParticipation(String token) {
    // TODO: implement ValidParticipation
    throw UnimplementedError();
  }

  @override
  Future<List<Datum>?> getEvents(String? token) async {
    final reponse =
        await apiService.get(endPoint: Endpoints.events, token: token);
    if (reponse.statusCode == 200) {
      logger.e("fetching success");
      final data = Event.fromJson(reponse.data);

      return data.data;
    } else {
      logger.e("fetching events failed");
      throw HandleError.handle(reponse.statusMessage);
    }
  }

  @override
  Future<void> getUniqueEvent(String token, int eventId) {
    // TODO: implement getUniqueEvent
    throw UnimplementedError();
  }
}
