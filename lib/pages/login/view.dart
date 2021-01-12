import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/toast_util.dart';
import 'package:flutter_netease_cloud_music/view/widgets/common_button.dart';
import 'package:flutter_netease_cloud_music/view/widgets/v_empty_view.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  ScreenUtil.init(viewService.context, width: 750, height: 1334);
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(80),
          right: ScreenUtil().setWidth(80),
          top: ScreenUtil().setWidth(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/icon_logo.png',
                width: ScreenUtil().setWidth(90),
                height: ScreenUtil().setWidth(90),
              ),
            ),
            _LoginAnimatedWidget(state, dispatch, viewService),
          ],
        ),
      ),
    ),
  );
}

Widget _LoginWidget(LoginState state, Dispatch dispatch, ViewService viewService) {

  return Theme(
    data: ThemeData(primaryColor: Colors.red),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
          child: Text(
            'Welcome Back!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 34,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setWidth(3)),
          child: Text(
            'The Flutter Netease Cloud Music App',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        VEmptyView(50),
        TextField(
          controller: state.phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              hintText: 'Phone',
              prefixIcon: Icon(
                Icons.phone_iphone,
                color: Colors.grey,
              )),
        ),
        VEmptyView(40),
        TextField(
          obscureText: true,
          controller: state.pwdController,
          decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              )),
        ),
        VEmptyView(120),
        CommonButton(
          callback: () {
            String phone = state.phoneController.text;
            String pwd = state.pwdController.text;
            if (phone.isEmpty || pwd.isEmpty) {
              showToast('请输入账号或者密码');
              return;
            }

            ///发起登陆请求Action，请求成功之后，保存用户信息，跳转到首页
          },
          content: 'Login',
          width: double.infinity,
        )
      ],
    ),
  );
}

Widget _LoginAnimatedWidget(
    LoginState state, Dispatch dispatch, ViewService viewService) {
  return Opacity(
    opacity: state.opacityTween.evaluate(state.animation),
    child: Container(
      margin: EdgeInsets.only(top: state.offsetTween.evaluate(state.animation)),
      child: _LoginWidget(state, dispatch,viewService),
    ),
  );
}
