import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/main/state.dart';

class MainComponentState extends ComponentState<MainState> with SingleTickerProviderStateMixin{

}

class MainComponent extends Component<MainState>{

  @override
  ComponentState<MainState> createState() {
    return MainComponentState();
  }
}