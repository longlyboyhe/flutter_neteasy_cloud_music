import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_netease_cloud_music/model/event.dart';

class EventState implements Cloneable<EventState> {
  EventRepository eventRepository;
  EasyRefreshController controller;
  @override
  EventState clone() {
    return EventState()
    ..eventRepository = eventRepository
    ..controller = controller
    ;
  }
}

EventState initState(Map<String, dynamic> args) {
  return EventState()
  ..eventRepository = EventRepository()
    ..controller = EasyRefreshController()
  ;
}
