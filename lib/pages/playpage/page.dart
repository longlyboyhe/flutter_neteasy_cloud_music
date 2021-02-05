import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/pages/playpage/player_component.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PlayPage extends Page<PlayPageState, Map<String, dynamic>> {
  PlayPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PlayPageState>(
                adapter: null,
                slots: <String, Dependent<PlayPageState>>{
                }),
            middleware: <Middleware<PlayPageState>>[
            ],);

  @override
  ComponentState<PlayPageState> createState() {
    return PlayPageComponentState();
  }

}
