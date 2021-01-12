import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/splash/state.dart';

class SplashComponentState extends ComponentState<SplashState> with SingleTickerProviderStateMixin{

}

class SplashComponent extends Component<SplashState>{

  @override
  ComponentState<SplashState> createState() {
    return SplashComponentState();
  }
}