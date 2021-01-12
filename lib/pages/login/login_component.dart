import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/login/state.dart';

class LoginComponentState extends ComponentState<LoginState> with SingleTickerProviderStateMixin{

}

class LoginComponent extends Component<LoginState>{

  @override
  ComponentState<LoginState> createState() {
    return LoginComponentState();
  }
}