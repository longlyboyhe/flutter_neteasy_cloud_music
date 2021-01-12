import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/animation.dart';

class SplashState implements Cloneable<SplashState> {
  AnimationController logoController;
  CurvedAnimation logoAnimation;

  @override
  SplashState createState() => SplashState();

  @override
  SplashState clone() {
    return SplashState()
    ..logoController = logoController
    ..logoAnimation =  logoAnimation;

  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}
