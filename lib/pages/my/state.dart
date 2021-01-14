import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/model/play_list.dart';
import 'package:flutter_netease_cloud_music/model/user/user.dart';

class MyState implements Cloneable<MyState> {
  List<Playlist> selfCreatePlayList = []; // 我创建的歌单
  List<Playlist> collectPlayList = []; // 收藏的歌单
  List<Playlist> allPlayList = []; // 所有的歌单
  Map<String, String> topMenuData;
  List<String> topMenuKeys;
  bool selfPlayListOffstage = false;
  bool collectPlayListOffstage = false;
  User user;
  @override
  MyState clone() {
    return MyState()
      ..selfCreatePlayList = selfCreatePlayList
      ..collectPlayList = collectPlayList
      ..allPlayList = allPlayList
      ..topMenuData = topMenuData
      ..topMenuKeys = topMenuKeys
      ..selfPlayListOffstage =selfPlayListOffstage
      ..collectPlayListOffstage = collectPlayListOffstage
      .. user = user
    ;
  }
}

MyState initState(Map<String, dynamic> args) {
  return MyState()
  ;
}
