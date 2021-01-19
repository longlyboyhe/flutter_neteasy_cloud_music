import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<LyricState> buildEffect() {
  return combineEffects(<Object, Effect<LyricState>>{
    LyricAction.action: _onAction,
  });
}

void _onAction(Action action, Context<LyricState> ctx) {
}
