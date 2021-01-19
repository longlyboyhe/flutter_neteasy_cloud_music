import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/pages/dailysongs/page.dart';
import 'package:flutter_netease_cloud_music/pages/login/page.dart';
import 'package:flutter_netease_cloud_music/pages/main/page.dart';
import 'package:flutter_netease_cloud_music/pages/player/page.dart';
import 'package:flutter_netease_cloud_music/pages/splash/page.dart';

///路由管理
class RouteConfig {
  ///定义你的路由名称比如   static final String routeHome = 'page/home';
  ///闪屏页
  static const String splashPage = 'pages/splash';

  ///主模块
  static const String mainPage = 'page/main';

  ///登录
  static const String loginPage = 'page/login';

  ///歌单详情
  static const String playList = 'page/main/login/register';

  ///每日推荐
  static const String dailySongs = 'page/home';

  ///排行榜
  static const String topList = 'page/webview';

  ///播放歌曲页面
  static const String playSongs = 'page/player';

  ///搜索页面
  static const String search = 'page/webview';

  ///查看图片页面
  static const String viewPic = 'page/webview';

  ///用户详情页面
  static const String userDetail = 'page/webview';

  ///将你的路由名称和页面映射在一起，比如：RouteConfig.homePage: HomePage(),
  static final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      RouteConfig.splashPage: SplashPage(),
      RouteConfig.loginPage: LoginPage(),
      RouteConfig.mainPage: MainPage(),
      RouteConfig.dailySongs: DailySongsPage(),
      RouteConfig.playSongs: PlayerPage(),
    },
  );
}
