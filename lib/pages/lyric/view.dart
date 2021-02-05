import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'state.dart';

Widget buildView(LyricState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      backgroundColor: Colors.transparent,
      body: state.lyrics == null
          ? Container(
              alignment: Alignment.center,
              child: Text(
                '歌词加载中...',
                style: commonWhiteTextStyle,
              ),
            )
          : GestureDetector(
              onTapDown: state.lyricWidget.isDragging
                  ? (e) {
                      if (e.localPosition.dx > 0 &&
                          e.localPosition.dx < ScreenUtil().setWidth(100) &&
                          e.localPosition.dy >
                              state.lyricWidget.canvasSize.height / 2 -
                                  ScreenUtil().setWidth(100) &&
                          e.localPosition.dy <
                              state.lyricWidget.canvasSize.height / 2 +
                                  ScreenUtil().setWidth(100)) {
                        //widget.model.seekPlay(_lyricWidget.dragLineTime);
                      }
                    }
                  : null,
              onVerticalDragUpdate: (e) {
                if (!state.lyricWidget.isDragging) {
                  // setState(() {
                  //   _lyricWidget.isDragging = true;
                  // });
                }
                state.lyricWidget.offsetY += e.delta.dy;
              },
              onVerticalDragEnd: (e) {
                // 拖动防抖
                // cancelDragTimer();
              },
              child: CustomPaint(
                size: Size(
                    ScreenUtil.screenWidth,
                    ScreenUtil.screenHeight -
                        kToolbarHeight -
                        ScreenUtil().setWidth(150) -
                        ScreenUtil().setWidth(50) -
                        ScreenUtil.statusBarHeight -
                        ScreenUtil().setWidth(120)),
                painter: state.lyricWidget,
              )));
}
