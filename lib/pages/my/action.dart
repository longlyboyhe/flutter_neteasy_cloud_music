import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum myAction { action }

class myActionCreator {
  static Action onAction() {
    return const Action(myAction.action);
  }
}
