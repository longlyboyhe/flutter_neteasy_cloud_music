import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/player/state.dart';

class PlayerComponentState extends ComponentState<PlayerState> with TickerProviderStateMixin{

}

class LoginComponent extends Component<PlayerState>{

  @override
  ComponentState<PlayerState> createState() {
    return PlayerComponentState();
  }
}