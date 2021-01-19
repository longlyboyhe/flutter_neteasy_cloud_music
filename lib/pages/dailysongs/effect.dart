import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/config/route.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/log_util.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';
import 'action.dart';
import 'state.dart';

Effect<DailySongsState> buildEffect() {
  return combineEffects(<Object, Effect<DailySongsState>>{
    Lifecycle.initState: _onInitAction,
    Lifecycle.dispose:_onDispose,
    DailySongsAction.play:_onPlay,
    DailySongsAction.goPlayPage:_onGoPlayPage,
    DailySongsAction.pause_or_resume:_onPauseOrResume,
  });
}

void _onInitAction(Action action, Context<DailySongsState> ctx) {
  ctx.state.audioPlayer = AudioPlayer();
  AudioPlayer.logEnabled = true;
  ctx.state.audioPlayer.setReleaseMode(ReleaseMode.STOP);
  // 播放状态监听
  ctx.state.audioPlayer.onPlayerStateChanged.listen((state) {
    ctx.state.curState = state;
    /// 先做顺序播放
    if(state == AudioPlayerState.COMPLETED){
      // nextPlay();
    }
    // 其实也只有在播放状态更新时才需要通知。
  });
  ctx.state.audioPlayer.onDurationChanged.listen((d) {
    ctx.state.curSongDuration = d;
  });
  // 当前播放进度监听
  ctx.state.audioPlayer.onAudioPositionChanged.listen((Duration p) {
    var m = p.inMilliseconds > ctx.state.curSongDuration.inMilliseconds ? ctx.state.curSongDuration.inMilliseconds : p.inMilliseconds;
    // 歌曲进度
    ctx.dispatch(DailySongsActionCreator.onProgressAction('$m-${ctx.state.curSongDuration.inMilliseconds}'));
  });

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    NetUtils.getDailySongsData(ctx.context).then((songsData) => {
      ctx.dispatch(DailySongsActionCreator.onUpdateAction(songsData))
    });
  });

}

void _onPlay(Action action, Context<DailySongsState> ctx) async{
  Song song = action.payload;
  var url = await NetUtils.getMusicURL(null, song.id);
  int result = await ctx.state.audioPlayer.play(url.replaceAll("http", "https"));
  if(result==1){
    LogUtil.e('result:$result',tag: 'paly');
  }
  ctx.dispatch(DailySongsActionCreator.onUpdateCurrentSongAction(song));
}

void _onPauseOrResume(Action action, Context<DailySongsState> ctx) async{
  if (ctx.state.audioPlayer.state == AudioPlayerState.PAUSED) {
    ctx.state.audioPlayer.resume();
  } else {
    ctx.state.audioPlayer.pause();
  }
}
void _onGoPlayPage(Action action, Context<DailySongsState> ctx){
  DailySongs ds = action.payload;
  if(ds!=null){
    Song song = new Song(ds.id,name:ds.name,picUrl: ds.al.picUrl,artists: '${ds?.ar?.map((a) => a?.name)}');
    Navigator.pushNamed(ctx.context, RouteConfig.playSongs,arguments: {"song":song});
  }

}

void _onDispose(Action action, Context<DailySongsState> ctx){
  ctx.state.audioPlayer.dispose();
}
