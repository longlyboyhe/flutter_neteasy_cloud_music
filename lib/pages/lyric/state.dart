import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/model/lyric.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_lyric.dart';

class LyricState implements Cloneable<LyricState> {
  LyricData lyricData;
  int curSongId;
  AnimationController lyricOffsetYController;
  List<Lyric> lyrics;
  Duration dragEndDuration = Duration(milliseconds: 1000);
  LyricWidget lyricWidget;
  Function dragEndFunc;
  @override
  LyricState clone() {
    return LyricState()
    ..lyricData = lyricData
      ..curSongId = curSongId
      ..lyricOffsetYController = lyricOffsetYController
      ..dragEndDuration = dragEndDuration
      ..lyrics = lyrics
      ..lyricWidget = lyricWidget
    ;
  }
}

LyricState initState(Map<String, dynamic> args) {
  return LyricState();
}
