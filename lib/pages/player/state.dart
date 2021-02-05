import 'package:audioplayers/audioplayers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';

class PlayerState implements Cloneable<PlayerState> {
  AudioPlayer audioPlayer;
  List<Song> listSongs = [];
  int curIndex = 0;
  Duration curSongDuration;
  AudioPlayerState curState;

  @override
  PlayerState clone() {
    return PlayerState()
      ..audioPlayer = audioPlayer
      ..listSongs = listSongs
      ..curIndex = curIndex
      ..curSongDuration = curSongDuration
      ..curState = curState;
    ;
  }
}

PlayerState initState(Map<String, dynamic> args) {
  PlayerState newState = PlayerState();
  return newState;
}
