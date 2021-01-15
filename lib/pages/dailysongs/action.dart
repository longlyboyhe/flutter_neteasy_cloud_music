import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DailySongsAction { action }

class DailySongsActionCreator {
  static Action onAction() {
    return const Action(DailySongsAction.action);
  }
}
