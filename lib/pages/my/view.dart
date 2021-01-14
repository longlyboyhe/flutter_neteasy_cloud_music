import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/toast_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_netease_cloud_music/model/play_list.dart';
import 'package:flutter_netease_cloud_music/view/widgets/playlist_title.dart';
import 'package:flutter_netease_cloud_music/view/widgets/rounded_net_image.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_create_play_list.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_play_list_menu.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildTopMenu(state),
          Container(
            color: Color(0xfff5f5f5),
            height: ScreenUtil().setWidth(25),
          ),
          state.allPlayList == null ? Container(
            height: ScreenUtil().setWidth(400),
            alignment: Alignment.center,
            child: CupertinoActivityIndicator(),
          ) : _buildPlayList(state,dispatch,viewService),
        ],
      ),
    ),
  );
}

///创建上面我的相关条目
Widget _buildTopMenu(MyState state) {
  return ListView.separated(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      var curKey = state.topMenuKeys[index];
      var curValue = state.topMenuData[state.topMenuKeys[index]];
      return Container(
        height: ScreenUtil().setWidth(110),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(140),
              child: Align(
                child: Image.asset(
                  curValue,
                  width: ScreenUtil().setWidth(100),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: Text(
                curKey,
                style: commonTextStyle,
              ),
            )
          ],
        ),
      );
    },
    separatorBuilder: (context, index) {
      return Container(
        color: Colors.grey,
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(140)),
        height: ScreenUtil().setWidth(0.3),
      );
    },
    itemCount: 5,
  );
}

/// 构建「我创建的歌单」「收藏的歌单」
Widget _buildPlayListItem(List<Playlist> data) {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var curPlayList = data[index];
        return ListTile(
          onTap: () {
            ///TODO 跳转到歌单详情页
            // NavigatorUtil.goPlayListPage(context,
            //     data: Recommend(
            //         picUrl: '${curPlayList.coverImgUrl}?param=150y150',
            //         name: curPlayList.name,
            //         playcount: curPlayList.playCount,
            //         id: curPlayList.id));
          },
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(5)),
            child: Text(curPlayList.name),
          ),
          subtitle: Text(
            '${curPlayList.trackCount}首',
            style: smallGrayTextStyle,
          ),
          leading: RoundedNetImage(
            '${curPlayList.coverImgUrl}?param=150y150',
            width: 110,
            height: 110,
            radius: ScreenUtil().setWidth(12),
          ),
          trailing: SizedBox(
            height: ScreenUtil().setWidth(50),
            width: ScreenUtil().setWidth(70),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
              onPressed: () {
                showModalBottomSheet<Playlist>(
                    context: context,
                    builder: (context) {
                      return PlayListMenuWidget(curPlayList);
                    },
                    backgroundColor: Colors.transparent)
                    .then((v) {
                  if (v != null) {
                    // 1 为删除
                    if(v.type == 1) {
                      ///TODO 删除当前
                      // _playListModel.delPlayList(curPlayList);
                      showToast('删除成功');
                    }
                  }
                });
              },
              padding: EdgeInsets.zero,
            ),
          ),
        );
      },
      itemCount: data.length);
}

Widget _realBuildPlayList(MyState state,Dispatch dispatch,ViewService viewService) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      PlaylistTitle("创建的歌单", state.selfCreatePlayList.length, () {
        dispatch(MyActionCreator.changeSelfPlayListOffstageAction(!state.selfPlayListOffstage));
      }, () {},
          trailing: SizedBox(
            height: ScreenUtil().setWidth(50),
            width: ScreenUtil().setWidth(70),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black87,
              ),
              onPressed: () {
                showDialog(
                    context: viewService.context,
                    builder: (context) {
                      return CreatePlayListWidget(
                        submitCallback: (name, isPrivate) {
                          _createPlaylist(viewService.context,name, isPrivate);
                        },
                      );
                    });
              },
              padding: EdgeInsets.zero,
            ),
          )),
      Offstage(
        offstage: state.selfPlayListOffstage,
        child: _buildPlayListItem(state.selfCreatePlayList),
      ),
      PlaylistTitle(
        "收藏的歌单",
        state.collectPlayList.length,
            () {
              dispatch(MyActionCreator.changeCollectPlayListOffstageAction(!state.collectPlayListOffstage));
        },
            () {},
      ),
      Offstage(
        offstage: state.collectPlayListOffstage,
        child: _buildPlayListItem(state.collectPlayList),
      ),
    ],
  );
}

/// 构建歌单
Widget _buildPlayList(MyState state,Dispatch dispatch,ViewService viewService) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
    child: _realBuildPlayList(state,dispatch,viewService),
  );
}

/// 创建歌单
void _createPlaylist(BuildContext context,String name, bool isPrivate) async {
  NetUtils.createPlaylist(context,
      params: {'name': name, 'privacy': isPrivate ? '10' : null})
      .catchError((e) {
    showToast('创建失败');
  }).then((result) {
    showToast('创建成功');
    ///TODO 创建歌单成功
    // Navigator.of(context).pop();
    // _playListModel.addPlayList(result.playlist..creator = _playListModel.selfCreatePlayList[0].creator);
  });
}

