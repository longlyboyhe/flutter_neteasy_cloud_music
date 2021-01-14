import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum discoverAction { action,goDailySongsPage }

class DiscoverActionCreator {
  static Action onAction() {
    return const Action(discoverAction.action);
  }

  static Action goDailySongsPageAction() {
    return  Action(discoverAction.goDailySongsPage);
  }
}
