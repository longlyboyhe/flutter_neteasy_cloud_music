import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/image/image_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundImgWidget extends StatelessWidget {
  final String img;
  final double width;
  final BoxFit fit;

  RoundImgWidget(this.img, this.width, {this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 2),
      child: img.startsWith('http')
          ? ImageUtil.showNetImage(img,
              width: ScreenUtil().setWidth(width),
              height: ScreenUtil().setWidth(width),
              fit: fit)
          : Image.asset(img, fit: fit,),
    );
  }
}
