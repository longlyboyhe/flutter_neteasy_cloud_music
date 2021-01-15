import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/data/date_util.dart';
import 'package:flutter_netease_cloud_music/model/daily_songs.dart';
import 'package:flutter_netease_cloud_music/model/music.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_music_list_item.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_play_list_app_bar.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'state.dart';

Widget buildView(
    DailySongsState state, Dispatch dispatch, ViewService viewService) {
  double _expandedHeight = ScreenUtil().setWidth(340);
  int _count;
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              bottom: ScreenUtil().setWidth(80) + ScreenUtil.bottomBarHeight),
          child: CustomScrollView(
            slivers: <Widget>[
              PlayListAppBarWidget(
                backgroundImg: 'images/bg_daily.png',
                count: _count,
                playOnTap: (model) {
                  /// playSongs(model, 0);
                },
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                      margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
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
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                      child: Text(
                        '根据你的音乐口味，为你推荐好音乐。',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
                expandedHeight: _expandedHeight,
                title: '每日推荐',
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    DailySongsData mDailySongsData = state.dailySongsData;
                    if(mDailySongsData!=null){
                      var data = mDailySongsData.data;
                      if(data!=null){
                        List<DailySongs> lds = data.dailySongs;
                        DailySongs ds = lds.elementAt(index);
                        return WidgetMusicListItem(
                          MusicData(
                              mvid: ds.al.id,
                              picUrl: ds.al.picUrl,
                              songName: ds.name,
                              artists:""
                              //"${ds.originSongSimpleData.artists.map((a) => a.name).toList().join('/')} - ${ds.originSongSimpleData.albumMeta.name}"
                              ),
                          onTap: () {
                            playSongs(ds, index);
                          },
                        );
                      }else{
                        return Container();
                      }
                    }else{
                      return Container();
                    }

                  },
                  childCount: 3,
                ),
              )
            ],
          ),
        ),

        ///TODO
        // PlayWidget(),
      ],
    ),
  );
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
