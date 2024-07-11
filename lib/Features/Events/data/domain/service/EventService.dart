

import 'package:flutterstarter/Features/Events/data/model/event/data.dart';

abstract class EventService {
  Future<void> getEvents(String token);
  Future<void> getUniqueEvent(String  token,int eventId);
  Future<void> CreateEvent(String token,Data eventModel,int limit,int orgnizerId);
  Future<void> UpdateEvent(String token,Data eventModel,int limit,int orgnizerId);
  Future<void> EventByLocation(String token);
  Future<void> ParticipateinEvent(String token);
  Future<void> ShareEvent(String token);
  Future<void> UserParticpations(String token);
  Future<void> ValidParticipation(String token);





}