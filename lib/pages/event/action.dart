import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum eventAction { action }

class eventActionCreator {
  static Action onAction() {
    return const Action(eventAction.action);
  }
}
