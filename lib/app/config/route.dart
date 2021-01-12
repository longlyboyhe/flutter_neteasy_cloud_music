import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_netease_cloud_music/pages/login/page.dart';
import 'package:flutter_netease_cloud_music/pages/main/page.dart';
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

  ///注册
  static const String registerPage = 'page/main/login/register';

  ///新闻主页面
  static const String homePage = 'page/home';

  ///展示文章内容，统一的容器
  static const String webViewPage = 'page/webview';


  ///将你的路由名称和页面映射在一起，比如：RouteConfig.homePage: HomePage(),
  static final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      RouteConfig.splashPage: SplashPage(),
      RouteConfig.loginPage: LoginPage(),
      RouteConfig.mainPage: MainPage(),
    },
  );
}
