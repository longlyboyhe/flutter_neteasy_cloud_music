import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/model/song.dart';

class PlayPageState implements Cloneable<PlayPageState> {
  AnimationController controller; // 封面旋转控制器
  AnimationController stylusController; //唱针控制器
  Animation<double> stylusAnimation;
  int switchIndex = 0; //用于切换歌词
  Song curSong;
  @override
  PlayPageState clone() {
    return PlayPageState()
      ..controller = controller
      ..stylusController = stylusController
      ..stylusAnimation = stylusAnimation
      ..switchIndex = switchIndex
      ..curSong = curSong;
    ;
  }
}

PlayPageState initState(Map<String, dynamic> args) {
  PlayPageState newState = PlayPageState();
  if(args.containsKey("song")){
    Song curSong =  args["song"];
    newState.curSong = curSong;
  }
  return newState;
}
