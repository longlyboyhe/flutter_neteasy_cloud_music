import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LyricAction { action }

class LyricActionCreator {
  static Action onAction() {
    return const Action(LyricAction.action);
  }
}
