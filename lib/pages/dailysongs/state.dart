import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';

class DailySongsState implements Cloneable<DailySongsState> {
  DailySongsData dailySongsData;
  @override
  DailySongsState clone() {
    return DailySongsState()
    ..dailySongsData = dailySongsData
    ;
  }
}

DailySongsState initState(Map<String, dynamic> args) {
  return DailySongsState();
}
