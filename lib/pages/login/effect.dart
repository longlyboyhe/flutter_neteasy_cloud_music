import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_netease_cloud_music/app/config/constants.dart';
import 'package:flutter_netease_cloud_music/app/config/route.dart';
import 'package:flutter_netease_cloud_music/app/utils/cache/sp_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/toast_util.dart';
import 'package:flutter_netease_cloud_music/model/user/user.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    Lifecycle.initState: _onInit,
    LoginAction.login:_login,

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

void _login(Action action, Context<LoginState> ctx) {
  String phone = ctx.state.phoneController.text;
  String pwd = ctx.state.pwdController.text;
   NetUtils.login(ctx.context, phone, pwd).then((user) => {
     if(user!=null&&user.code==200){
      SpUtil.put(Constants.USER_INFO, user.toJson()),
      Navigator.pushNamed(ctx.context, RouteConfig.mainPage)
     }else{
       showToast('登录失败')
     }
   });

}
