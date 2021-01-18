import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/play_songs_model.dart';

class DailySongsState implements Cloneable<DailySongsState> {
  DailySongsData dailySongsData;
  PlaySongsModel playSongsModel;
  @override
  DailySongsState clone() {
    return DailySongsState()
    ..dailySongsData = dailySongsData
    ..playSongsModel = playSongsModel
    ;
  }
}

DailySongsState initState(Map<String, dynamic> args) {
  return DailySongsState();
}
