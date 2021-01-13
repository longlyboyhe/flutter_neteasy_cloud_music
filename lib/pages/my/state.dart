import 'package:fish_redux/fish_redux.dart';

class myState implements Cloneable<myState> {

  @override
  myState clone() {
    return myState();
  }
}

myState initState(Map<String, dynamic> args) {
  return myState();
}
