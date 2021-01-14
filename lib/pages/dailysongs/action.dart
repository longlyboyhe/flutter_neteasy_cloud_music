import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum dailysongsAction { action }

class dailysongsActionCreator {
  static Action onAction() {
    return const Action(dailysongsAction.action);
  }
}
