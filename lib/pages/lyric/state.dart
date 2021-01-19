import 'package:fish_redux/fish_redux.dart';

class LyricState implements Cloneable<LyricState> {

  @override
  LyricState clone() {
    return LyricState();
  }
}

LyricState initState(Map<String, dynamic> args) {
  return LyricState();
}
