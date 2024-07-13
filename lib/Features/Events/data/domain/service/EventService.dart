import 'package:flutterstarter/Features/Events/data/model/event/datum.dart';

abstract class EventService {
  Future<void> getEvents(String token);
  Future<void> getUniqueEvent(String token, int eventId);
  Future<void> createEvent(
      String token, Datum eventModel, int limit, int orgnizerId);
  Future<void> updateEvent(
      String token, Datum eventModel, int limit, int orgnizerId);
  Future<void> eventByLocation(String token);
  Future<void> participateinEvent(String token, int eventId);
  Future<void> shareEvent(String token);
  Future<void> userParticpations(String token, int eventId);
  Future<void> validParticipation(String token);
}
