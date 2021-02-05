import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/playpage/state.dart';

class PlayPageComponentState extends ComponentState<PlayPageState> with TickerProviderStateMixin{

}

class PlayPageComponent extends Component<PlayPageState>{

  @override
  ComponentState<PlayPageState> createState() {
    return PlayPageComponentState();
  }
}