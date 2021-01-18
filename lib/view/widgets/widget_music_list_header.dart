import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_netease_cloud_music/model/play_songs_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'h_empty_view.dart';

typedef PlayModelCallback = void Function(PlaySongsModel model);

class MusicListHeader extends StatelessWidget implements PreferredSizeWidget {
  MusicListHeader({this.count, this.tail, this.onTap});

  final int count;
  final Widget tail;
  final PlayModelCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(child: ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(ScreenUtil().setWidth(30))),
      child: Container(
        color: Colors.white,
        child: InkWell(
          onTap: (){
            // onTap(model);
          },
          child: SizedBox.fromSize(
            size: preferredSize,
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
                    "(共$count首)",
                    style: smallGrayTextStyle,
                  ),
                ),
                Spacer(),
                tail ?? Container(),
              ],
            ),
          ),
        ),
      ),
    ), preferredSize: Size.fromHeight(ScreenUtil().setWidth(100)));
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setWidth(100));
}
