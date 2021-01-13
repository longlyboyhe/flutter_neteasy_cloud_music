import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<myState> buildReducer() {
  return asReducer(
    <Object, Reducer<myState>>{
      myAction.action: _onAction,
    },
  );
}

myState _onAction(myState state, Action action) {
  final myState newState = state.clone();
  return newState;
}
