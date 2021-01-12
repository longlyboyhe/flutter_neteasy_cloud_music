//初始化一些必须的操作
import 'package:flutter/cupertino.dart';
import 'package:flutter_netease_cloud_music/app/utils/cache/sp_util.dart';
import 'package:flutter_netease_cloud_music/app/utils/http/net_utils.dart';
import 'package:flutter_netease_cloud_music/app/utils/show/log_util.dart';
import 'package:flutter_screenutil/screenutil.dart';

void initApp(BuildContext context) {
  //初始化本地缓存
  SpUtil.init();
  LogUtil.init(tag: 'NETEASE_MUSIC');
  NetUtils.init();
}
