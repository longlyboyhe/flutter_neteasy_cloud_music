import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as mr;
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/image/image_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_netease_cloud_music/pages/lyric/page.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_round_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'state.dart';

Widget buildView(PlayPageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Stack(
      children: <Widget>[
        ImageUtil.showNetImage(
          '${state.curSong.picUrl}?param=200y200',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 100,
            sigmaX: 100,
          ),
          child: Container(
            color: Colors.black38,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        AppBar(
          centerTitle: true,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                state.curSong.name,
                style: commonWhiteTextStyle,
              ),
              Text(
                state.curSong.artists,
                style: smallWhite70TextStyle,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: kToolbarHeight + ScreenUtil.statusBarHeight),
          child: Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    // setState(() {
                    //   if(switchIndex == 0){
                    //     switchIndex = 1;
                    //   }else{
                    //     switchIndex = 0;
                    //   }
                    // });
                  },
                  child: IndexedStack(
                    index: state.switchIndex,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin: EdgeInsets.only(top: ScreenUtil().setWidth(150)),
                              child: RotationTransition(
                                turns: state.controller,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    mr.Image.asset(
                                      'images/bet.png',
                                      width: ScreenUtil().setWidth(550),
                                    ),
                                    RoundImgWidget('${state.curSong.picUrl}?param=200y200', 370),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            child: RotationTransition(
                              turns: state.stylusAnimation,
                              alignment: Alignment(
                                  -1 +
                                      (ScreenUtil().setWidth(45 * 2) /
                                          (ScreenUtil().setWidth(293))),
                                  -1 +
                                      (ScreenUtil().setWidth(45 * 2) /
                                          (ScreenUtil().setWidth(504)))),
                              child: Image.asset(
                                'images/bgm.png',
                                width: ScreenUtil().setWidth(205),
                                height: ScreenUtil().setWidth(352.8),
                              ),
                            ),
                            alignment: Alignment(0.25, -1),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              // buildSongsHandle(model),
              // Padding(
              //   padding:
              //   EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              //   child: SongProgressWidget(model),
              // ),
              // PlayBottomMenuWidget(model),
              // VEmptyView(20),
            ],
          ),
        )
      ],
    ),
  );
}
