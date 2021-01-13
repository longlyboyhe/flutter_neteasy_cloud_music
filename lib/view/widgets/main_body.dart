import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/typedef/function.dart';
import 'package:flutter_netease_cloud_music/pages/main/state.dart';


class MainBody extends StatelessWidget {
  MainBody({
    this.data,
    this.onChanged,
  });

  ///数据源
  final MainState data;

  ///页面切换监听
  final ParamSingleCallback<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children:data.tabPage,
      //禁止页面左右滑动切换
      controller: data.tabController,
    );
  }
}
