

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/log_util.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';

class AudioPlayerManager {
  factory AudioPlayerManager() => _getInstance();
  static AudioPlayerManager get instance => _getInstance();
  static AudioPlayerManager _instance;
  static const String PLAYER_ID = "YD_AUDIO_PLAYER";
  AudioPlayer _player;
  List<Song> listSongs = [];
  int curIndex = 0;
  Duration curSongDuration;
  AudioPlayerManager._internal() {
    // 初始化播放器
    _player = AudioPlayer(playerId: PLAYER_ID);
    // 默认使用循环播放模式
    _player.setReleaseMode(ReleaseMode.STOP);

    _init();
  }

  void _init() {
    // 播放状态监听
    _player.onPlayerStateChanged.listen((state) {
      /// 先做顺序播放
      if (state == AudioPlayerState.COMPLETED) {
        ///播放下一首
        nextPlay();
      }
      // 其实也只有在播放状态更新时才需要通知。
      // notifyListeners();
    });
    _player.onDurationChanged.listen((d) {
      curSongDuration = d;
    });
    // // 当前播放进度监听
    // _player.onAudioPositionChanged.listen((Duration p) {
    //   var m = p.inMilliseconds > curSongDuration.inMilliseconds
    //       ? curSongDuration.inMilliseconds
    //       : p.inMilliseconds;
    //   // ctx.broadcast(PlayerActionCreator.onProgressAction(
    //   //     '$m-${ctx.state.curSongDuration.inMilliseconds}'));
    // });
  }

  static AudioPlayerManager _getInstance() {
    if (_instance == null) {
      _instance = new AudioPlayerManager._internal();
    }
    return _instance;
  }

  /// 播放
  Future<int> play(Song song) async {
    if(listSongs.isEmpty){
      listSongs.insert(curIndex, song);
      String url = await getPlayUrl();
      return _player.play(url);
    }else if(song.id==listSongs.first.id){
      togglePlay();
    }else{
      listSongs.insert(curIndex, song);
      String url = await getPlayUrl();
      return _player.play(url);
    }
  }

  /// 播放
  Future<int> playAllSongs(List<Song> listSong) async {
    listSongs.addAll(listSong);
    String url = await getPlayUrl();
    return _player.play(url);
  }


  /// 暂停、恢复
  void togglePlay() {
    if (getState() == AudioPlayerState.PAUSED) {
      resume();
    } else {
      pause();
    }
  }

  /// 暂停
  Future<int> pause() async {
    return _player.pause();
  }

  /// resume
  Future<int> resume() async {
    return _player.resume();
  }

  /// 下一首
  Future<int> nextPlay() async{
    if (curIndex >= listSongs.length) {
      curIndex = 0;
    } else {
      curIndex++;
    }
    String url = await getPlayUrl();
    return _player.play(url);
  }

  /// 上一首
  Future<int> prePlay() async{
    if (curIndex <= 0) {
      curIndex = listSongs.length - 1;
    } else {
      curIndex--;
    }
    String url = await getPlayUrl();
    return _player.play(url);
  }

  /// 停止
  Future<int> stop() async {
    return _player.stop();
  }

  /// 获取当前播放状态
  AudioPlayerState getState() {
    return _player.state;
  }

  ///获取当前播放Url
  Future<String> getPlayUrl() async{
    var songId = listSongs[curIndex].id;
    LogUtil.e('songId:$songId',tag: 'paly');
    var url = await NetUtils.getMusicURL(null, songId);
    var result = url.replaceAll("http", "https");
    return result;
  }

  void dispose() {
    _player.dispose();
  }
}
