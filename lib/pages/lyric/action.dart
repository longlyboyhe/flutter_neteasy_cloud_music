import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LyricAction { update }

class LyricActionCreator {
  static Action onUpdateAction() {
    return Action(LyricAction.update);
  }
}
