import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/keep_alive_page.dart';
import 'package:flutter_netease_cloud_music/pages/discover/page.dart';
import 'package:flutter_netease_cloud_music/pages/event/page.dart';
import 'package:flutter_netease_cloud_music/pages/my/page.dart';

class MainState implements Cloneable<MainState> {
  ///底部导航栏tab标识
  int selectedIndex = 0;
  ///tab页面
  List<Widget> tabPage;
  ///tab按钮
  List<Tab> tabBar;

  ///页面控制器
  TabController tabController;
  @override
  MainState clone() {
    return MainState()
      ..selectedIndex = selectedIndex
      ..tabController = tabController
      ..tabBar = tabBar
      ..tabPage = tabPage;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState()
    ..selectedIndex = 0
    ..tabBar = [
      Tab(text: '发现'),
      Tab(text: "我的"),
      Tab(text: "动态"),
    ]
    ..tabPage = [
      keepAlivePage(DiscoverPage().buildPage(null)),
      keepAlivePage(MyPage().buildPage(null)),
      keepAlivePage(EventPage().buildPage(null)),
    ]
  ;
}
