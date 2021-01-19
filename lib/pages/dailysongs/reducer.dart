import 'package:fish_redux/fish_redux.dart';
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
  return newState;
}

DailySongsState _onUpdateCurrentAction(DailySongsState state, Action action) {
  final DailySongsState newState = state.clone();
  Song song = action.payload;
  newState.currentPlaySong = song;
  return newState;
}
// DailySongsState _onPlyOneAction(DailySongsState state, Action action) {
//   final DailySongsState newState = state.clone();
//   List<DailySongs>  dailySongsData = action.payload;
//   DailySongs ds = dailySongsData?.first;
//   if(ds!=null){
//     Song song = new Song(ds.mv,name:ds.name,picUrl: ds.al.picUrl,artists: '${ds?.ar?.map((a) => a?.name)}');
//     newState.playSongsModel?.playSong(song);
//   }
//   return newState;
// }
//
// DailySongsState _onPlyAllAction(DailySongsState state, Action action) {
//   final DailySongsState newState = state.clone();
//   List<DailySongs> songs = action.payload;
//   List<Song> _songs = [];
//   for(DailySongs ds in songs){
//    Song song = new Song(ds.mv,name:ds.name,picUrl: ds.al.picUrl,artists: '${ds?.ar?.map((a) => a?.name)}');
//    _songs.add(song);
//   }
//   newState.playSongsModel?.playSongs(_songs);
//   return newState;
// }

DailySongsState _onPlyProgressAction(DailySongsState state, Action action) {
  final DailySongsState newState = state.clone();
  String progress = action.payload;
  newState.progress = progress;
  return newState;
}