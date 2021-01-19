import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<PlayerState> buildEffect() {
  return combineEffects(<Object, Effect<PlayerState>>{
    Lifecycle.initState:_initState,
    PlayerAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PlayerState> ctx) {
}

void _initState(Action action, Context<PlayerState> ctx) {
  TickerProvider providerStateMixin = ctx.stfState as TickerProvider;
  ctx.state.controller =
      AnimationController(vsync: providerStateMixin, duration: Duration(seconds: 20));
  ctx.state.stylusController =
      AnimationController(vsync: providerStateMixin, duration: Duration(milliseconds: 400));
  ctx.state.stylusAnimation =
      Tween<double>(begin: -0.03, end: -0.10).animate(ctx.state.stylusController);
  ctx.state.controller.addStatusListener((status) {
    // 转完一圈之后继续
    if (status == AnimationStatus.completed) {
      ctx.state.controller.reset();
      ctx.state.controller.forward();
    }
  });
}
