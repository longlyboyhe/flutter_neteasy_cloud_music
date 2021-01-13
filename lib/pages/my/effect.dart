import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<myState> buildEffect() {
  return combineEffects(<Object, Effect<myState>>{
    myAction.action: _onAction,
  });
}

void _onAction(Action action, Context<myState> ctx) {
}
