import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/data/date_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/image/image_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_netease_cloud_music/model/album.dart';
import 'package:flutter_netease_cloud_music/model/mv.dart';
import 'package:flutter_netease_cloud_music/model/recommend.dart';
import 'package:flutter_netease_cloud_music/view/widgets/h_empty_view.dart';
import 'package:flutter_netease_cloud_music/view/widgets/v_empty_view.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_banner.dart' ;
import 'package:flutter_netease_cloud_music/model/banner.dart' as HomeBanner;
import 'package:flutter_netease_cloud_music/view/widgets/widget_future_builder.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_play_list.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(DiscoverState state, Dispatch dispatch, ViewService viewService){
  return Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBanner(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                VEmptyView(40),
                _buildHomeCategoryList(dispatch),
                VEmptyView(20),
                Text(
                  '推荐歌单',
                  style: commonTextStyle,
                ),
              ],
            ),
          ),
          VEmptyView(20),
          _buildRecommendPlayList(),
          VEmptyView(30),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15),
            ),
            child: Text(
              '新碟上架',
              style: commonTextStyle,
            ),
          ),
          VEmptyView(20),
          _buildNewAlbum(),
          VEmptyView(30),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(15),
            ),
            child: Text(
              'MV 排行',
              style: commonTextStyle,
            ),
          ),
          VEmptyView(20),
          _buildTopMv(),
        ],
      ),
    ),
  );
}

/// 构建轮播图
Widget _buildBanner() {
  return CustomFutureBuilder<HomeBanner.Banner>(
    futureFunc: NetUtils.getBannerData,
    builder: (context, data) {
      return CustomBanner(
          data.banners.map((e) => '${e.pic}?param=540y210').toList());
    },
  );
}

/// 构建分类列表
Widget _buildHomeCategoryList(Dispatch dispatch) {
  var map = {
    '每日推荐': 'images/icon_daily.png',
    '歌单': 'images/icon_playlist.png',
    '排行榜': 'images/icon_rank.png',
    '电台': 'images/icon_radio.png',
    '直播': 'images/icon_look.png',
  };

  var keys = map.keys.toList();
  var width = ScreenUtil().setWidth(100);

  return GridView.custom(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.only(bottom: 10),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: keys.length,
      childAspectRatio: 1 / 1.1,
    ),
    childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            switch (index) {
              case 0:
                dispatch(DiscoverActionCreator.goDailySongsPageAction());
                //NavigatorUtil.goDailySongsPage(context);
                break;
              case 1:
                break;
              case 2:
                //NavigatorUtil.goTopListPage(context);
                break;
            }
          },
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: width,
                    height: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width / 2),
                        border: Border.all(color: Colors.black12, width: 0.5),
                        gradient: RadialGradient(
                          colors: [
                            Color(0xFFFF8174),
                            Colors.red,
                          ],
                          center: Alignment(-1.7, 0),
                          radius: 1,
                        ),
                        color: Colors.red),
                  ),
                  Image.asset(
                    map[keys[index]],
                    width: width,
                    height: width,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: keys[index] == '每日推荐'
                        ? Text(
                      '${DateUtil.formatDate(DateTime.now(), format: 'dd')}',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    )
                        : Text(''),
                  )
                ],
              ),
              VEmptyView(10),
              Text(
                '${keys[index]}',
                style: TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ],
          ),
        );
      },
      childCount: keys.length,
    ),
  );
}

/// 构建推荐歌单
Widget _buildRecommendPlayList() {
  return CustomFutureBuilder<RecommendData>(
    futureFunc: NetUtils.getRecommendData,
    builder: (context, snapshot) {
      var data = snapshot.recommend;
      return Container(
          height: ScreenUtil().setWidth(300),
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return HEmptyView(ScreenUtil().setWidth(30));
            },
            padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
            itemBuilder: (context, index) {
              return PlayListWidget(
                text: data[index].name,
                picUrl: data[index].picUrl,
                playCount: data[index].playcount,
                maxLines: 2,
                onTap: () {
                 // NavigatorUtil.goPlayListPage(context, data: data[index]);
                },
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
          ));
    },
  );
}

/// 构建新碟上架
Widget _buildNewAlbum() {
  return CustomFutureBuilder<AlbumData>(
      futureFunc: NetUtils.getAlbumData,
      builder: (context, snapshot) {
        var data = snapshot.weekData;
        return Container(
            height: ScreenUtil().setWidth(300),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return HEmptyView(ScreenUtil().setWidth(30));
              },
              padding:
              EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
              itemBuilder: (context, index) {
                return PlayListWidget(
                  text: data[index].name,
                  picUrl: data[index].picUrl,
                  subText: data[index].artist.name ?? "",
                  maxLines: 1,
                );
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
            ));
      });
}

/// 构建MV 排行榜
Widget _buildTopMv() {
  return CustomFutureBuilder<MVData>(
      futureFunc: NetUtils.getTopMvData,
      builder: (context, snapshot) {
        var data = snapshot.data;
        return ListView.separated(
          separatorBuilder: (context, index) {
            return VEmptyView(ScreenUtil().setWidth(100));
          },
          padding:
          EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: ImageUtil.showNetImage(
                    '${data[index].cover}?param=350&197',
                  ),
                ),
                VEmptyView(5),
                Text(
                  data[index].name,
                  style: commonTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                VEmptyView(2),
                Text(
                  data[index].artistName,
                  style: smallGrayTextStyle,
                ),
              ],
            );
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
        );
      });
}
