import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/config/constants.dart';
import 'package:flutter_netease_cloud_music/app/config/route.dart';
import 'package:flutter_netease_cloud_music/app/utils/cache/sp_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';

import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    ///进入页面就执行的初始化操作
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _toMainPage(Context<SplashState> ctx) async{
  ///有用回信息，说明已经登陆
  if(SpUtil.get(Constants.USER_INFO) != null){
    await NetUtils.refreshLogin(ctx.context).then((value){
      if(value!=null&&value.data != -1){
        Navigator.pushNamed(ctx.context, RouteConfig.mainPage);
      }else{
        Navigator.pushNamed(ctx.context, RouteConfig.loginPage);
      }
    });
  }else{
    ///无会用信息，说明车位已满
   Navigator.pushNamed(ctx.context, RouteConfig.loginPage);
  }

}

void _init(Action action, Context<SplashState> ctx) {
  final TickerProvider tickerProviderStateMixin = ctx.stfState as TickerProvider;
  var scaleTween  = Tween(begin: 0, end: 1);
  ctx.state.logoController =
      AnimationController(vsync:tickerProviderStateMixin,duration: Duration(milliseconds: 500))
        ..drive(scaleTween)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(Duration(milliseconds: 500), () {
              _toMainPage(ctx);
            });
          }
        });
  ctx.state.logoAnimation =
      CurvedAnimation(parent: ctx.state.logoController, curve: Curves.easeOutQuart);

  Future.delayed(Duration(milliseconds: 500), () {
    ctx.state.logoController.forward();
  });
}

void _dispose(Action action, Context<SplashState> ctx) {
  ctx.state.logoController.dispose();
}
