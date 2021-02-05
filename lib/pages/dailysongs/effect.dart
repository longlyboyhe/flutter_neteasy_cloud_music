import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/config/route.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/log_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/tool/audio_player_manager.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';
import 'package:flutter_netease_cloud_music/pages/player/action.dart';
import 'action.dart';
import 'state.dart';

Effect<DailySongsState> buildEffect() {
  return combineEffects(<Object, Effect<DailySongsState>>{
    Lifecycle.initState: _onInitAction,
    Lifecycle.dispose:_onDispose,
    DailySongsAction.play:_onPlay,
    DailySongsAction.goPlayPage:_onGoPlayPage,
    DailySongsAction.pause_or_resume:_onPauseOrResume
  });
}

void _onInitAction(Action action, Context<DailySongsState> ctx) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    NetUtils.getDailySongsData(ctx.context).then((songsData) => {
      ctx.dispatch(DailySongsActionCreator.onUpdateAction(songsData))
    });
  });
}

void _onPlay(Action action, Context<DailySongsState> ctx) async{
  Song song = action.payload;
  int result = await AudioPlayerManager.instance.play(song);
  if(result==1){
    LogUtil.e('result:$result',tag: 'paly');
  }
  ctx.dispatch(DailySongsActionCreator.onUpdateCurrentSongAction(song));
}

void _onPauseOrResume(Action action, Context<DailySongsState> ctx) async{
  Song song = action.payload;
  AudioPlayerManager.instance.togglePlay();
  ctx.dispatch(DailySongsActionCreator.onUpdateCurrentSongAction(song));
}
void _onGoPlayPage(Action action, Context<DailySongsState> ctx){
  DailySongs ds = action.payload;
  if(ds!=null){
    Song song = new Song(ds.id,name:ds.name,picUrl: ds.al.picUrl,artists: '${ds?.ar?.map((a) => a?.name)}');
    Navigator.pushNamed(ctx.context, RouteConfig.playSongs,arguments: {"song":song});
  }

}

void _onDispose(Action action, Context<DailySongsState> ctx){
  AudioPlayerManager.instance.pause();
}
