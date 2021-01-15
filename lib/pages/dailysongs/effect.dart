import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';

import 'action.dart';
import 'state.dart';

Effect<DailySongsState> buildEffect() {
  return combineEffects(<Object, Effect<DailySongsState>>{
    Lifecycle.initState: _onInitAction,
  });
}

void _onInitAction(Action action, Context<DailySongsState> ctx) {
  NetUtils.getDailySongsData(ctx.context).then((songsData) => {
    ctx.state.dailySongsData = songsData
  });
}
