import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<dailysongsState> buildEffect() {
  return combineEffects(<Object, Effect<dailysongsState>>{
    dailysongsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<dailysongsState> ctx) {
}
