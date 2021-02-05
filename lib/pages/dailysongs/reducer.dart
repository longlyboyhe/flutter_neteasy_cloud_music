import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/app/utils/tool/audio_player_manager.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';

import 'action.dart';
import 'state.dart';

Reducer<DailySongsState> buildReducer() {
  return asReducer(
    <Object, Reducer<DailySongsState>>{
      DailySongsAction.update: _onUpdateAction,
      DailySongsAction.update_current_song: _onUpdateCurrentAction,
      DailySongsAction.progress:_onPlyProgressAction,
    },
  );
}

DailySongsState _onUpdateAction(DailySongsState state, Action action) {
  final DailySongsState newState = state.clone();
  DailySongsData dailySongsData = action.payload;
  newState.dailySongsData = dailySongsData;
  DailySongs ds = dailySongsData?.data?.dailySongs?.first;
  if(ds!=null){
    Song song = new Song(ds.id,name:ds.name,picUrl: ds.al.picUrl,artists: '${ds?.ar?.map((a) => a?.name)}');
    newState.currentPlaySong = song;
  }
  newState.curState = AudioPlayerManager.instance.getState();
  return newState;
}

DailySongsState _onUpdateCurrentAction(DailySongsState state, Action action) {
  final DailySongsState newState = state.clone();
  Song song = action.payload;
  newState.curState = AudioPlayerManager.instance.getState();
  newState.currentPlaySong = song;
  return newState;
}


DailySongsState _onPlyProgressAction(DailySongsState state, Action action) {
  final DailySongsState newState = state.clone();
  String progress = action.payload;
  newState.progress = progress;
  return newState;
}