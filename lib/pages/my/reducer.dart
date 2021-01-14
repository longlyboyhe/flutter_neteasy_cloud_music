import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyState>>{
      MyAction.update: _onUpdateAction,
      MyAction.changeCollectPlayListOffstage:_changeCollectPlayListOffstage,
      MyAction.changeSelfPlayListOffstage:_changeSelfPlayListOffstage,
    },
  );
}

MyState _onUpdateAction(MyState state, Action action) {
  final MyState newState = state.clone();
  return newState;
}

MyState _changeCollectPlayListOffstage(MyState state, Action action) {
  final MyState newState = state.clone();
  return newState
    ..collectPlayListOffstage = action.payload;
}
MyState _changeSelfPlayListOffstage(MyState state, Action action) {
  final MyState newState = state.clone();
  return newState
    ..selfPlayListOffstage = action.payload;
  ;
}