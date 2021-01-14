import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<dailysongsState> buildReducer() {
  return asReducer(
    <Object, Reducer<dailysongsState>>{
      dailysongsAction.action: _onAction,
    },
  );
}

dailysongsState _onAction(dailysongsState state, Action action) {
  final dailysongsState newState = state.clone();
  return newState;
}
