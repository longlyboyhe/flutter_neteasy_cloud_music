import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/play_songs_model.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';

class DailySongsState implements Cloneable<DailySongsState> {
  DailySongsData dailySongsData;
  AudioPlayer audioPlayer;
  AudioPlayerState curState;
  Duration curSongDuration;
  String progress;
  Song currentPlaySong;
  @override
  DailySongsState clone() {
    return DailySongsState()
      ..dailySongsData = dailySongsData
      ..audioPlayer = audioPlayer
      ..curState =curState
      ..curSongDuration =curSongDuration
      ..progress = progress
      ..currentPlaySong = currentPlaySong
    ;
  }
}

DailySongsState initState(Map<String, dynamic> args) {
  return DailySongsState();
}
