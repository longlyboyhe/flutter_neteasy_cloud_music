import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/lyric_util.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_lyric.dart';

import 'action.dart';
import 'state.dart';

Function dragEndFunc;
Effect<LyricState> buildEffect() {
  return combineEffects(<Object, Effect<LyricState>>{
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<LyricState> ctx) {}

void _initState(Action action, Context<LyricState> ctx) async {
  TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  WidgetsBinding.instance.addPostFrameCallback((call) async {
    ctx.state.lyricData = await NetUtils.getLyricData(ctx.context,
        params: {'id': ctx.state.curSongId});
    ctx.state.lyrics = LyricUtils.formatLyric(ctx.state.lyricData.lrc.lyric);
    ctx.state.lyricWidget = LyricWidget(ctx.state.lyrics, 0);
    ctx.dispatch(LyricActionCreator.onUpdateAction());
    dragEndFunc = () {
      if (ctx.state.lyricWidget.isDragging) {
        // setState(() {
        //   _lyricWidget.isDragging = false;
        // });
      }
    };
  });
}
