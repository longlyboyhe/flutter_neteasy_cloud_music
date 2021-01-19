import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LyricPage extends Page<LyricState, Map<String, dynamic>> {
  LyricPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<LyricState>(
                adapter: null,
                slots: <String, Dependent<LyricState>>{
                }),
            middleware: <Middleware<LyricState>>[
            ],);

}
