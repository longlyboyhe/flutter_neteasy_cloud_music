import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LyricState> buildReducer() {
  return asReducer(
    <Object, Reducer<LyricState>>{
      LyricAction.action: _onAction,
    },
  );
}

LyricState _onAction(LyricState state, Action action) {
  final LyricState newState = state.clone();
  return newState;
}
