import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlayPageAction { action }

class PlayActionCreator {
  static Action onAction() {
    return const Action(PlayPageAction.action);
  }
}
