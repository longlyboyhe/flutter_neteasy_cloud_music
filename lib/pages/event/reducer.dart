import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<EventState> buildReducer() {
  return asReducer(
    <Object, Reducer<EventState>>{
      eventAction.action: _onAction,
    },
  );
}

EventState _onAction(EventState state, Action action) {
  final EventState newState = state.clone();
  return newState;
}
