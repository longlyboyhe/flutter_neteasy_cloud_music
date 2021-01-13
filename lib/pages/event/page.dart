import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class EventPage extends Page<EventState, Map<String, dynamic>> {
  EventPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<EventState>(
                adapter: null,
                slots: <String, Dependent<EventState>>{
                }),
            middleware: <Middleware<EventState>>[
            ],);

}
