import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    //初始化
    Lifecycle.initState: _init,
    //切换tab
    MainAction.selectTab: _selectTab,
  });
}

void _init(Action action, Context<MainState> ctx) {
  final TickerProvider tickerProviderStateMixin = ctx.stfState as TickerProvider;
  ctx.state.tabController = TabController(vsync: tickerProviderStateMixin, length: 3);
}

void _selectTab(Action action, Context<MainState> ctx) {
  ctx.state.selectedIndex = action.payload;
  // ctx.dispatch(MainActionCreator.onRefresh());
}

void _onAction(Action action, Context<MainState> ctx) {
}
