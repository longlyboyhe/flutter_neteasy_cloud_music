import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/keep_alive_page.dart';
import 'package:flutter_netease_cloud_music/pages/discover/page.dart';
import 'package:flutter_netease_cloud_music/pages/event/page.dart';
import 'package:flutter_netease_cloud_music/pages/my/page.dart';
import 'package:flutter_netease_cloud_music/view/widgets/main_body.dart';
import 'package:flutter_netease_cloud_music/view/widgets/main_tabbar_navigation.dart';
import 'package:flutter_netease_cloud_music/view/widgets/v_empty_view.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_round_img.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  ScreenUtil.init(viewService.context, width: 750, height: 1334);
  return Scaffold(
    // 设置没有高度的 appbar，目的是为了设置状态栏的颜色
    appBar: PreferredSize(
      child: AppBar(
        elevation: 0,
      ),
      preferredSize: Size.zero,
    ),
    backgroundColor: Colors.white,
    body: SafeArea(
      bottom: false,
      child: Stack(
        children: <Widget>[
          Padding(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 20,
                      top: 5,
                      child: GestureDetector(
                            onTap: () => {
                              ///根据用户id，跳到用户详情页面
                            },
                            child:
                            RoundImgWidget('https://p4.music.126.net/ma8NC_MpYqC-dK_L81FWXQ==/109951163250233892.jpg', 70),
                          )
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(150)),
                      child: TabBar(
                        labelStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        unselectedLabelStyle: TextStyle(fontSize: 14,color: Colors.black),
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.black,
                        indicator: UnderlineTabIndicator(),
                        indicatorColor: Colors.black,
                        controller: state.tabController,
                        tabs: [
                          Tab(
                            text: '发现',
                          ),
                          Tab(
                            text: '我的',
                          ),
                          Tab(
                            text: '动态',
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                         // NavigatorUtil.goSearchPage(context);
                        },
                      ),
                    ),
                  ],
                ),
                VEmptyView(20),
                Expanded(
                  child: TabBarView(
                    controller: state.tabController,
                    children: [
                      keepAlivePage(DiscoverPage().buildPage(null)),
                      keepAlivePage(MyPage().buildPage(null)),
                      keepAlivePage(EventPage().buildPage(null)),
                    ],
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(
                bottom:
                ScreenUtil().setWidth(80) + ScreenUtil.bottomBarHeight),
          ),
          // PlayWidget(),
        ],
      ),
    ),
  );
  // PlayWidget(),
}
