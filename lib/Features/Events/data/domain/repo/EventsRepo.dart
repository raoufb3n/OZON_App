import 'package:flutterstarter/Core/Helper/ApiConstant.dart';
import 'package:flutterstarter/Core/Helper/ApiServicecs.dart';
import 'package:flutterstarter/Core/Helper/Failure.dart';
import 'package:flutterstarter/Features/Events/data/domain/service/EventService.dart';
import 'package:flutterstarter/Features/Events/data/model/event/data.dart';
import 'package:flutterstarter/Features/Events/data/model/event/event.dart';
import 'package:logger/logger.dart';

class EventsRepo implements EventService {
  final ApiService apiService = ApiService();
    final Logger logger = Logger();

  @override
  Future<void> CreateEvent(
      String token, Data eventModel, int limit, int orgnizerId) {
    // TODO: implement CreateEvent
    throw UnimplementedError();
  }

  @override
  Future<void> EventByLocation(String token) {
    // TODO: implement EventByLocation
    throw UnimplementedError();
  }

  @override
  Future<void> ParticipateinEvent(String token) {
    // TODO: implement ParticipateinEvent
    throw UnimplementedError();
  }

  @override
  Future<void> ShareEvent(String token) {
    // TODO: implement ShareEvent
    throw UnimplementedError();
  }

  @override
  Future<void> UpdateEvent(
      String token, Data eventModel, int limit, int orgnizerId) {
    // TODO: implement UpdateEvent
    throw UnimplementedError();
  }

  @override
  Future<void> UserParticpations(String token) {
    // TODO: implement UserParticpations
    throw UnimplementedError();
  }

  @override
  Future<void> ValidParticipation(String token) {
    // TODO: implement ValidParticipation
    throw UnimplementedError();
  }

  @override
  Future<Event> getEvents(String? token) async{
    final reponse = await apiService.post(endPoint: Endpoints.events,token: token);
    if (reponse.statusCode == 200) {
      logger.e("fetching success");
      final events = Event.fromJson(reponse.data);
      return events;
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
