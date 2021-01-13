import 'dart:convert';


import 'package:extended_image/extended_image.dart';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/data/date_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/data/event_special_text_span_builder.dart';
import 'package:flutter_netease_cloud_music/app/utils/image/image_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_netease_cloud_music/model/event.dart';
import 'package:flutter_netease_cloud_music/model/song.dart' as MySong;
import 'package:flutter_netease_cloud_music/model/event_content.dart';
import 'package:flutter_netease_cloud_music/view/widgets/h_empty_view.dart';
import 'package:flutter_netease_cloud_music/view/widgets/rounded_net_image.dart';
import 'package:flutter_netease_cloud_music/view/widgets/v_empty_view.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_event_song.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_event_video.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_round_img.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:loading_more_list/loading_more_list.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(EventState state, Dispatch dispatch, ViewService viewService) {
  
  return RefreshIndicator(
    child: LoadingMoreList(ListConfig<Event>(
        collectGarbage: (List<int> garbages) {
          garbages.forEach((index) {
            state.eventRepository[index]
                .pics
                .map((p) => p.originUrl)
                .toList()
                .forEach((url) {
              final provider = ExtendedNetworkImageProvider(url);
              provider.evict();
            });
          });
        },
        itemBuilder: (context, curData, index) {
          EventContent curContent;
          Widget contentWidget;
          // type 35：纯文字， 39：video，18：song
          switch (curData.type) {
            case 35:
              break;
            case 39:
              curContent = EventContent.fromJson(json.decode(curData.json));
              contentWidget = EventVideoWidget(curContent.video);
              break;
            case 18:
              curContent = EventContent.fromJson(json.decode(curData.json));
              contentWidget = EventSongWidget(MySong.Song(curContent.song.id,
                  name: curContent.song.name,
                  picUrl: curContent.song.album.picUrl,
                  artists:
                  curContent.song.artists.map((a) => a.name).join('/')));
              break;
            default:
              curContent = EventContent.fromJson(json.decode(curData.json));
              break;
          }
          return _buildCommonTemplate(curData, curContent, contentWidget);
        },
        sourceList: state.eventRepository)),
    onRefresh: () async {
      // await state.eventRepository.refresh();
    },
  );
}

// 构建动态通用的模板（头像、粉丝等）
Widget _buildCommonTemplate(
    Event data, EventContent contentData, Widget content) {
  TextSpan textSpan = TextSpan(
    children: [
      TextSpan(text: data.user.nickname, style: common14BlueTextStyle),
    ],
  );
  // type 35：纯文字， 39：video，18：song
  switch (data.type) {
    case 35:
      break;
    case 39:
      textSpan.children.add(
        TextSpan(text: ' 分享视频：', style: common14TextStyle),
      );
      break;
    case 18:
      textSpan.children.add(
        TextSpan(text: ' 分享单曲：', style: common14TextStyle),
      );
      break;
  }
  Widget title = RichText(text: textSpan);

  Widget picsWidget; // 图片widget
  int crossCount;
  List<BuildContext> picsContexts = [];

  if (data.pics.isEmpty) {
    picsWidget = Container();
  } else if (data.pics.length == 1) {
    picsWidget = Builder(builder: (context) {
      picsContexts.add(context);
      return GestureDetector(
        onTap: () {
          // NavigatorUtil.goLookImgPage(
          //     context, data.pics.map((p) => p.originUrl).toList(), 0);

//            Navigator.push(context, LookImgRoute(data.pics.map((p) => p.originUrl).toList(), 0, picsContexts));
        },
        child: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(15)),
          // child: ImageUtil.showNetImage(data.pics[0].originUrl),
        ),
      );
    });
  } else {
    if (data.pics.length >= 2 && data.pics.length < 5) crossCount = 2;
    if (data.pics.length > 4) crossCount = 3;

    picsWidget = Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(15)),
      child: GridView.custom(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossCount,
            mainAxisSpacing: ScreenUtil().setWidth(10),
            crossAxisSpacing: ScreenUtil().setWidth(10)),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          var w = Builder(
            builder: (context) {
              picsContexts.add(context);
              return GestureDetector(
                onTap: () {
                  // NavigatorUtil.goLookImgPage(context,
                  //     data.pics.map((p) => p.originUrl).toList(), index);
//                  Navigator.push(context, LookImgRoute(data.pics.map((p) => p.originUrl).toList(), index, picsContexts));
                },
                child: Hero(
                  tag: '${data.pics[index].originUrl}$index',
                  child: RoundedNetImage(
                    data.pics[index].originUrl,
                    fit: BoxFit.cover,
                    radius: 5,
                  ),
                ),
              );
            },
          );
          return w;
        }, childCount: data.pics.length),
      ),
    );
  }

  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setWidth(15),
        horizontal: ScreenUtil().setWidth(30)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RoundImgWidget(
          data.user.avatarUrl,
          80,
        ),
        HEmptyView(10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        title,
                        VEmptyView(5),
                        Text(
                          DateUtil.formatDateMs(data.eventTime,
                              format: 'MM月dd日 HH:mm'),
                          style: smallGrayTextStyle,
                        ),
                      ],
                    ),
                  ),
                  data.user.followed
                      ? Chip(
                    label: Text(
                      '取消关注',
                      style: common14WhiteTextStyle,
                    ),
                    backgroundColor: Colors.red,
                  )
                      : Chip(
                      labelPadding: EdgeInsets.only(
                          right: ScreenUtil().setWidth(15)),
                      avatar: Icon(
                        Icons.add,
                        size: ScreenUtil().setWidth(30),
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                      label: Text(
                        '关注',
                        style: common14WhiteTextStyle,
                      ))
                ],
              ),
              VEmptyView(10),
              // contentData == null
              //     ? Container()
              //     : ExtendedText(
              //   contentData.msg ?? "",
              //   specialTextSpanBuilder: EventSpecialTextSpanBuilder(),
              //   style: TextStyle(
              //       fontSize: 15, color: Colors.black87, height: 1.5),
              // ),
              picsWidget,
              content == null
                  ? Container()
                  : Padding(
                padding:
                EdgeInsets.only(top: ScreenUtil().setWidth(15)),
                child: content,
              ),
              VEmptyView(20),
              _buildCommonBottomBar(data),
            ],
          ),
        )
      ],
    ),
  );
}

// 构建通用底部bar
Widget _buildCommonBottomBar(Event data) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        flex: 2,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'images/icon_event_share.png',
              width: ScreenUtil().setWidth(35),
            ),
            HEmptyView(5),
            Text(
              data.info.shareCount.toString(),
              style: common13GrayTextStyle,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'images/icon_event_comment.png',
              width: ScreenUtil().setWidth(35),
            ),
            HEmptyView(5),
            Text(
              data.info.commentCount.toString(),
              style: common13GrayTextStyle,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'images/icon_event_commend.png',
              width: ScreenUtil().setWidth(35),
            ),
            HEmptyView(5),
            Text(
              data.info.likedCount.toString(),
              style: common13GrayTextStyle,
            ),
          ],
        ),
      ),
      Spacer(),
    ],
  );
}