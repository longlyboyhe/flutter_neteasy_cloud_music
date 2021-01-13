import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<EventState> buildEffect() {
  return combineEffects(<Object, Effect<EventState>>{
    eventAction.action: _onAction,
  });
}

void _onAction(Action action, Context<EventState> ctx) {
}
