import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/play_songs_model.dart';

import 'action.dart';
import 'state.dart';

Effect<DailySongsState> buildEffect() {
  return combineEffects(<Object, Effect<DailySongsState>>{
    Lifecycle.initState: _onInitAction,
  });
}

void _onInitAction(Action action, Context<DailySongsState> ctx) {
  ctx.state.playSongsModel = PlaySongsModel();
  ctx.state.playSongsModel.init();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    NetUtils.getDailySongsData(ctx.context).then((songsData) => {
      ctx.dispatch(DailySongsActionCreator.onPalyOneAction(songsData.data.dailySongs)),
      ctx.dispatch(DailySongsActionCreator.onUpdateAction(songsData))
    });
  });

}
