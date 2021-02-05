import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LyricState> buildReducer() {
  return asReducer(
    <Object, Reducer<LyricState>>{
      LyricAction.update: _onUpdateAction,
    },
  );
}

LyricState _onUpdateAction(LyricState state, Action action) {
  final LyricState newState = state.clone();
  return newState;
}
