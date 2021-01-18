import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/data/date_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/music.dart';
import 'package:flutter_netease_cloud_music/model/play_songs_model.dart';
import 'package:flutter_netease_cloud_music/pages/dailysongs/action.dart';
import 'package:flutter_netease_cloud_music/view/widgets/flexible_detail_bar.dart';
import 'package:flutter_netease_cloud_music/view/widgets/h_empty_view.dart';
import 'package:flutter_netease_cloud_music/view/widgets/rounded_net_image.dart';
import 'package:flutter_netease_cloud_music/view/widgets/v_empty_view.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_play.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'state.dart';

Widget buildView(
    DailySongsState state, Dispatch dispatch, ViewService viewService) {
  double _expandedHeight = ScreenUtil().setWidth(340);
  var mDailySongs = getDailySongs(state);
  int count;
  if (mDailySongs != null) {
    count = mDailySongs.length;
  }
  PlaySongsModel playSongsModel =  state.playSongsModel;
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              bottom: ScreenUtil().setWidth(80) + ScreenUtil.bottomBarHeight),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: true,
                expandedHeight: _expandedHeight,
                pinned: true,
                elevation: 0,
                brightness: Brightness.dark,
                iconTheme: IconThemeData(color: Colors.white),
                title: Text(
                  '每日推荐',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                bottom: PreferredSize(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(ScreenUtil().setWidth(30))),
                      child: Container(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            dispatch(DailySongsActionCreator.onPalyAllAction(mDailySongs));
                          },
                          child: SizedBox.fromSize(
                            size: Size.fromHeight(ScreenUtil().setWidth(100)),
                            child: Row(
                              children: <Widget>[
                                HEmptyView(20),
                                Icon(
                                  Icons.play_circle_outline,
                                  size: ScreenUtil().setWidth(50),
                                ),
                                HEmptyView(10),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    "播放全部",
                                    style: mCommonTextStyle,
                                  ),
                                ),
                                HEmptyView(5),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: count == null
                                      ? Container()
                                      : Text(
                                          '(共$count首)',
                                          style: smallGrayTextStyle,
                                        ),
                                ),
                                Spacer(),
                                Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    preferredSize: Size.fromHeight(ScreenUtil().setWidth(100))),
                flexibleSpace: FlexibleDetailBar(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Container(
                        padding:
                            EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                        margin:
                            EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text:
                                      '${DateUtil.formatDate(DateTime.now(), format: 'dd')} ',
                                  style: TextStyle(fontSize: 30)),
                              TextSpan(
                                  text:
                                      '/ ${DateUtil.formatDate(DateTime.now(), format: 'MM')}',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                        margin:
                            EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                        child: Text(
                          '根据你的音乐口味，为你推荐好音乐。',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  background: Stack(
                    children: <Widget>[
                      Image.asset(
                        'images/bg_daily.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaY: 5,
                          sigmaX: 5,
                        ),
                        child: Container(
                          color: Colors.black38,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    DailySongs data;
                    if (mDailySongs != null) {
                      data = mDailySongs.elementAt(index);
                    }
                    return Container(
                      width: ScreenUtil.screenWidth,
                      height: ScreenUtil().setWidth(120),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          data?.al?.picUrl == null
                              ? Container()
                              : HEmptyView(15),
                          data?.al?.picUrl == null
                              ? Container()
                              : RoundedNetImage(
                                  '${data.al.picUrl}?param=150y150',
                                  width: 100,
                                  height: 100,
                                  radius: 5,
                                ),
                          data?.al?.picUrl == null
                              ? Container()
                              : HEmptyView(10),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data?.name ?? "歌曲名称",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: commonTextStyle,
                                ),
                                VEmptyView(10),
                                Text(
                                  '${data?.ar?.map((a) => a?.name)?.toList()?.join('/')} - ${data?.al?.name}',
                                  style: smallGrayTextStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: data?.id == 0
                                ? Container()
                                : IconButton(
                                    icon: Icon(Icons.play_circle_outline),
                                    onPressed: () {},
                                    color: Colors.grey,
                                  ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: count,
                ),
              )
            ],
          ),
        ),
        PlayWidget(model: playSongsModel),
      ],
    ),
  );
}

List<DailySongs> getDailySongs(DailySongsState state) {
  DailySongsData mDailySongsData = state.dailySongsData;
  if (mDailySongsData != null) {
    var data = mDailySongsData.data;
    if (data != null) {
      List<DailySongs> lds = data.dailySongs;
      return lds;
    }
    return null;
  }
  return null;
}

void playSongs(DailySongs ds, int index) {
  // model.playSongs(
  //   data.recommend
  //       .map((r) => Song(
  //             r.id,
  //             name: r.name,
  //             picUrl: r.album.picUrl,
  //             artists: '${r.artists.map((a) => a.name).toList().join('/')}',
  //           ))
  //       .toList(),
  //   index: index,
  // );

  ///NavigatorUtil.goPlaySongsPage(context);
}

void setCount(int count) {
  Future.delayed(Duration(milliseconds: 300), () {
    // if (mounted) {
    //   setState(() {
    //     _count = count;
    //   });
    // }
  });
}
