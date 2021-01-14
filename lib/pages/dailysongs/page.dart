import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class dailysongsPage extends Page<dailysongsState, Map<String, dynamic>> {
  dailysongsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<dailysongsState>(
                adapter: null,
                slots: <String, Dependent<dailysongsState>>{
                }),
            middleware: <Middleware<dailysongsState>>[
            ],);

}
