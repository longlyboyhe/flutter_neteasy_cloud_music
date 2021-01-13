import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction {
  ///切换tab
  selectTab
}

class MainActionCreator {
  static Action selectTab(int index) {
    return Action(MainAction.selectTab, payload: index);
  }
}
