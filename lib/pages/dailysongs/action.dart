import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';

//TODO replace with your own action
enum DailySongsAction { update,play_all,play_one}

class DailySongsActionCreator {
  static Action onUpdateAction(DailySongsData dailySongsData) {
    return  Action(DailySongsAction.update,payload: dailySongsData);
  }
  static Action onPalyAllAction(List<DailySongs> dailySongsList) {
    return  Action(DailySongsAction.play_all,payload: dailySongsList);
  }
  static Action onPalyOneAction(List<DailySongs> dailySongsList) {
    return  Action(DailySongsAction.play_one,payload: dailySongsList);
  }
}
