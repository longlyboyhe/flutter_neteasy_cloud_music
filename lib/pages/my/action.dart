import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MyAction { action,update,changeSelfPlayListOffstage,changeCollectPlayListOffstage }

class MyActionCreator {
  static Action onAction() {
    return const Action(MyAction.action);
  }

  static Action updateAction() {
    return  Action(MyAction.update);
  }

  static Action changeSelfPlayListOffstageAction(bool offstage) {
    return Action(MyAction.changeSelfPlayListOffstage,payload: offstage);
  }

  static Action changeCollectPlayListOffstageAction(bool offstage) {
    return Action(MyAction.changeCollectPlayListOffstage,payload: offstage);
  }
}
