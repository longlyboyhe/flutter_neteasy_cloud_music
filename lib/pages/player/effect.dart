import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/utils/cache/sp_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/log_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/tool/fluro_convert_utils.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';

import 'action.dart';
import 'state.dart';

Effect<PlayerState> buildEffect() {
  return combineEffects(<Object, Effect<PlayerState>>{
    PlayerAction.initState: _initState,
    PlayerAction.playSong: _onPlaySongAction,
    PlayerAction.playSongs: _onPlaySongsAction,
    PlayerAction.addSongs: _onAddSongsAction,
    PlayerAction.nextPlay: _onNextPlayAction,
    PlayerAction.prePlay: _onPrePlayAction,
    PlayerAction.togglePlay: _onTogglePlayAction,
    PlayerAction.dispose: _onDispose
  });
}

void _initState(Action action, Context<PlayerState> ctx) {
  ctx.state.audioPlayer.setReleaseMode(ReleaseMode.STOP);
  // 播放状态监听
  ctx.state.audioPlayer.onPlayerStateChanged.listen((state) {
    ctx.state.curState = state;

    /// 先做顺序播放
    if (state == AudioPlayerState.COMPLETED) {
      ///播放下一首
      ctx.dispatch(PlayerActionCreator.onNextPlayAction());
    }
    // 其实也只有在播放状态更新时才需要通知。
    // notifyListeners();
  });
  ctx.state.audioPlayer.onDurationChanged.listen((d) {
    ctx.state.curSongDuration = d;
  });
  // 当前播放进度监听
  ctx.state.audioPlayer.onAudioPositionChanged.listen((Duration p) {
    var m = p.inMilliseconds > ctx.state.curSongDuration.inMilliseconds
        ? ctx.state.curSongDuration.inMilliseconds
        : p.inMilliseconds;
    ctx.broadcast(PlayerActionCreator.onProgressAction(
        '$m-${ctx.state.curSongDuration.inMilliseconds}'));
  });
}

void _onPlaySongAction(Action action, Context<PlayerState> ctx) {
  Song song = action.payload;
  LogUtil.e('song:$song',tag: 'paly');
  ctx.state.listSongs.insert(ctx.state.curIndex, song);
  play(ctx);
}

void _onPlaySongsAction(Action action, Context<PlayerState> ctx) {
  Map<String, dynamic> map = action.payload;
  ctx.state.listSongs = map['songs'];
  int index = map['index'];
  if (index != null) ctx.state.curIndex = index;
  play(ctx);
}

/// 下一首
void _onNextPlayAction(Action action, Context<PlayerState> ctx) {
  if (ctx.state.curIndex >= ctx.state.listSongs.length) {
    ctx.state.curIndex = 0;
  } else {
    ctx.state.curIndex++;
  }
  play(ctx);
}

/// 上一首
void _onPrePlayAction(Action action, Context<PlayerState> ctx) {
  if (ctx.state.curIndex <= 0) {
    ctx.state.curIndex = ctx.state.listSongs.length - 1;
  } else {
    ctx.state.curIndex--;
  }
  play(ctx);
}

/// 暂停、恢复
void _onTogglePlayAction(Action action, Context<PlayerState> ctx) {
  if (ctx.state.audioPlayer.state == AudioPlayerState.PAUSED) {
    resumePlay(ctx);
  } else {
    pausePlay(ctx);
  }
}

void _onAddSongsAction(Action action, Context<PlayerState> ctx) {
  List<Song> list = action.payload;
  ctx.state.listSongs.addAll(list);
}

/// 播放
void play(Context<PlayerState> ctx) async {
  var songId = ctx.state.listSongs[ctx.state.curIndex].id;
  LogUtil.e('songId:$songId',tag: 'paly');
  var url = await NetUtils.getMusicURL(null, songId);
  int result = await ctx.state.audioPlayer.play(url.replaceAll("http", "https"));
  if(result==1){
    LogUtil.e('result:$result',tag: 'paly');
  }
  saveCurSong(ctx);
}

// 暂停
void pausePlay(Context<PlayerState> ctx) {
  ctx.state.audioPlayer.pause();
}

/// 恢复播放
void resumePlay(Context<PlayerState> ctx) {
  ctx.state.audioPlayer.resume();
}

// 保存当前歌曲到本地
void saveCurSong(Context<PlayerState> ctx) {
  SpUtil.remove('playing_songs');
  SpUtil.put<List>(
      'playing_songs',
      ctx.state.listSongs
          .map((s) => FluroConvertUtils.object2string(s))
          .toList());
  SpUtil.put<int>('playing_index', ctx.state.curIndex);
}

void _onDispose(Action action, Context<PlayerState> ctx) {
  ctx.state.audioPlayer.dispose();
}
