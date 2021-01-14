import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/config/constants.dart';
import 'package:flutter_netease_cloud_music/app/utils/cache/sp_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/log_util.dart';
import 'package:flutter_netease_cloud_music/model/play_list.dart';
import 'package:flutter_netease_cloud_music/model/user/user.dart';
import 'dart:convert';
import 'action.dart';
import 'state.dart';

Effect<MyState> buildEffect() {
  return combineEffects(<Object, Effect<MyState>>{
    Lifecycle.initState: _initState,
    MyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MyState> ctx) {}

void _initState(Action action, Context<MyState> ctx) {
  ctx.state.topMenuData = {
    '本地音乐': 'images/icon_music.png',
    '最近播放': 'images/icon_late_play.png',
    '下载管理': 'images/icon_download_black.png',
    '我的电台': 'images/icon_broadcast.png',
    '我的收藏': 'images/icon_collect.png',
  };
  ctx.state.topMenuKeys = ctx.state.topMenuData.keys.toList();
  initUser(ctx)
      .then((user) => {getSelfPlaylist(ctx, user).then((value) => {
    ctx.state.allPlayList = value,
    ctx.state.selfCreatePlayList =
    ctx.state.allPlayList.where((p) => p.creator.userId == user.account.id).toList(),
    ctx.state.collectPlayList =
    ctx.state.allPlayList.where((p) => p.creator.userId != user.account.id).toList(),
    ctx.dispatch(MyActionCreator.updateAction())
  })});
  // WidgetsBinding.instance.addPostFrameCallback((d){
  //   if(mounted) {
  //
  //   }
  // });
}

Future<User> initUser(Context<MyState> ctx) async {
  User user;
  await SpUtil.get<String>(Constants.USER_INFO)
      .then((jsonRes) => {
         LogUtil.e(json.decode(jsonRes),tag:"444444"),
         user = User.fromJson(json.decode(jsonRes))
      });
  return user;
}

Future<List<Playlist>> getSelfPlaylist(Context<MyState> ctx, User user) async {
  MyPlayListData myPalyList = await NetUtils.getSelfPlaylistData(ctx.context,
      params: {'uid': user.account.id});
  return myPalyList.playlist;
}

