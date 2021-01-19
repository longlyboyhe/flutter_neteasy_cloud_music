import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';

//TODO replace with your own action
enum DailySongsAction { update,play_all,play_one,play,progress,pause_or_resume,update_current_song,goPlayPage}

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

  static Action onPaly(Song song) {
    return  Action(DailySongsAction.play,payload: song);
  }

  static Action onPauseOrResume(Song song) {
    return  Action(DailySongsAction.pause_or_resume,payload: song);
  }

  static Action onProgressAction(String progress) {
    return  Action(DailySongsAction.progress,payload: progress);
  }
  static Action onUpdateCurrentSongAction(Song song) {
    return  Action(DailySongsAction.update_current_song,payload: song);
  }

  static Action goPalyPageAction(DailySongs song) {
    return  Action(DailySongsAction.goPlayPage,payload: song);
  }

}
