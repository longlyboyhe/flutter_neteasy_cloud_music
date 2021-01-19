import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/pages/player/player_component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlayerPage extends Page<PlayerState, Map<String, dynamic>> {
  PlayerPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlayerState>(
                adapter: null,
                slots: <String, Dependent<PlayerState>>{
                }),
            middleware: <Middleware<PlayerState>>[
            ],);

  @override
  ComponentState<PlayerState> createState() {
    return PlayerComponentState();
  }

}
