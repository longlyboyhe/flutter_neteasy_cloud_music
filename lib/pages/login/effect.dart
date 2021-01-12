import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    Lifecycle.initState: _onInit,

  });
}

void _onInit(Action action, Context<LoginState> ctx) {
  TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  ctx.state.controller =
      AnimationController(vsync: tickerProvider, duration: Duration(milliseconds: 300));
  ctx.state.animation = CurvedAnimation(parent: ctx.state.controller, curve: Curves.linear);
  ctx.state.phoneController = TextEditingController();
  ctx.state.pwdController = TextEditingController();
  ctx.state.opacityTween = Tween(begin: 0, end: 1);
  ctx.state.offsetTween = Tween(begin: 40, end: 0);
  Future.delayed(Duration(milliseconds: 500), () {
    ctx.state.controller.forward();
  });
}
