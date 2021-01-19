import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayerAction { action }

class PlayerActionCreator {
  static Action onAction() {
    return const Action(PlayerAction.action);
  }
}
