import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/typedef/function.dart';
import 'package:flutter_netease_cloud_music/pages/main/state.dart';

class MainTabBarNavigation extends StatelessWidget {
  MainTabBarNavigation({
    this.data,
    this.onTap,
  });

  ///数据源
  final MainState data;

  ///点击回调
  final ParamSingleCallback<int> onTap;

  @override
  Widget build(BuildContext context) {
    return _bottom();
  }

  Widget _bottom() {
    return TabBar(
      labelStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 14),
      indicator: UnderlineTabIndicator(),
      controller: data.tabController,
      tabs:data.tabPage,
      onTap: (int index) {
        onTap(index);
      },
    );
  }
}
