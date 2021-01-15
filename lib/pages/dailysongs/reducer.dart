import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DailySongsState> buildReducer() {
  return asReducer(
    <Object, Reducer<DailySongsState>>{
      DailySongsAction.action: _onAction,
    },
  );
}

DailySongsState _onAction(DailySongsState state, Action action) {
  final DailySongsState newState = state.clone();
  return newState;
}
