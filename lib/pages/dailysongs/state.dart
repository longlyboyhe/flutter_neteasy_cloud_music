import 'package:fish_redux/fish_redux.dart';

class dailysongsState implements Cloneable<dailysongsState> {

  @override
  dailysongsState clone() {
    return dailysongsState();
  }
}

dailysongsState initState(Map<String, dynamic> args) {
  return dailysongsState();
}
