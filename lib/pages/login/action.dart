import 'package:fish_redux/fish_redux.dart';

enum LoginAction { action, login }

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onLoginAction() {
    return const Action(LoginAction.login);
  }
}
