import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PlayPageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PlayPageState>>{
      PlayPageAction.action: _onAction,
    },
  );
}

PlayPageState _onAction(PlayPageState state, Action action) {
  final PlayPageState newState = state.clone();
  return newState;
}
