import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/lyric/state.dart';

class LyricComponentState extends ComponentState<LyricState> with TickerProviderStateMixin{

}

class LyricComponent extends Component<LyricState>{

  @override
  ComponentState<LyricState> createState() {
    return LyricComponentState();
  }
}