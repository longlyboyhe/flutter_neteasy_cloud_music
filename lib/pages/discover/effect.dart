import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/config/route.dart';

import 'action.dart';
import 'state.dart';

Effect<DiscoverState> buildEffect() {
  return combineEffects(<Object, Effect<DiscoverState>>{
    discoverAction.goDailySongsPage: _onGoDailySongsPageAction,
  });
}

void _onGoDailySongsPageAction(Action action, Context<DiscoverState> ctx) {
  Navigator.pushNamed(ctx.context, RouteConfig.dailySongs);
}
