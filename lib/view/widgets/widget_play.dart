import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_netease_cloud_music/model/play_songs_model.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_round_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'h_empty_view.dart';

/// 所有页面下面的播放条
class PlayWidget extends StatelessWidget {
  final PlaySongsModel model;

  PlayWidget({
    this.model
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil().setWidth(110) + ScreenUtil.bottomBarHeight,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[200])),
            color: Colors.white),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
        child: Container(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil().setWidth(110),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
          alignment: Alignment.center,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              ///TODO 跳转到播放页面
              // NavigatorUtil.goPlaySongsPage(context);
            },
            child: Row(
              children: <Widget>[
                RoundImgWidget(model?.curSong?.picUrl??"测试练剑", 80),
                HEmptyView(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(model?.curSong?.name??"名称", style: commonTextStyle, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      Text(model?.curSong?.artists??"掘金", style: common13TextStyle,),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    if(model.curState == null){
                      model.play();
                    }else {
                      model.togglePlay();
                    }
                  },
                  child: Image.asset(
                    model.curState == AudioPlayerState.PLAYING
                        ? 'images/pause.png'
                        :
                    'images/play.png',
                    width: ScreenUtil().setWidth(50),
                  ),
                ),
                HEmptyView(15),
                GestureDetector(
                  onTap: (){},
                  child: Image.asset(
                    'images/list.png',
                    width: ScreenUtil().setWidth(50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
