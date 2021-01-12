import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {
  Animation<double> animation;
  AnimationController controller;
  TextEditingController phoneController;
  TextEditingController pwdController;
  Tween<double> opacityTween;
  Tween<double> offsetTween;
  @override
  LoginState clone() {
    return LoginState()
        ..phoneController = phoneController
        ..pwdController = pwdController
        ..animation = animation
        ..controller = controller;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
