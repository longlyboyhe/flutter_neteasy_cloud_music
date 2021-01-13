import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyPage extends Page<myState, Map<String, dynamic>> {
  MyPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<myState>(
                adapter: null,
                slots: <String, Dependent<myState>>{
                }),
            middleware: <Middleware<myState>>[
            ],);

}
