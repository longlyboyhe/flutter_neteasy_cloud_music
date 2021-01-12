import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(SplashState state, Dispatch dispatch, ViewService viewService) {
  return _bodyWidget(state, dispatch,viewService);
}

Widget _bodyWidget(SplashState state, Dispatch dispatch,ViewService viewService) {
  ScreenUtil.init(viewService.context, width: 750, height: 1334);
  return Scaffold(
    backgroundColor: Colors.white,
    body: Container(
      height: double.infinity,
      width: double.infinity,
      child: ScaleTransition(
        scale: state.logoAnimation,
        child: Hero(
          tag: 'logo',
          child: Image.asset('images/icon_logo.png'),
        ),
      ),
    ),
  );
}
