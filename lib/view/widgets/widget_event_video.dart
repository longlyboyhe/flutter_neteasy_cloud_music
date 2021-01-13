import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/data/date_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/tool/number_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/common_text_style.dart';
import 'package:flutter_netease_cloud_music/model/event_content.dart';
import 'package:flutter_netease_cloud_music/view/widgets/rounded_net_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'h_empty_view.dart';

class EventVideoWidget extends StatefulWidget {
  final Video video;

  EventVideoWidget(this.video);

  @override
  _EventVideoWidgetState createState() => _EventVideoWidgetState();
}

class _EventVideoWidgetState extends State<EventVideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // RoundedNetImage(
        //   widget.video.coverUrl,
        // ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                color: Colors.black26),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/icon_event_video_play.png',
                    width: ScreenUtil().setWidth(100),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Image.asset('images/icon_event_video_b_play.png',
                          width: ScreenUtil().setWidth(50)),
                      Text(
                        NumberUtils.amountConversion(widget.video.playTime),
                        style: common14WhiteTextStyle,
                      ),
                      Spacer(),
                      Image.asset(
                        'images/icon_event_video_bar.png',
                        width: ScreenUtil().setWidth(25),
                        fit: BoxFit.cover,
                      ),
                      HEmptyView(5),
                      Text(
                        DateUtil.formatDateMs(
                            Duration(seconds: widget.video.duration)
                                .inMilliseconds,
                            format: 'mm:ss'),
                        style: common14WhiteTextStyle,
                      ),
                      HEmptyView(10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
