import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app/config/route.dart';
import 'app/init.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网易云音乐',
      // localizationsDelegates: [
      //   //国际化
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      home: RouteConfig.routes.buildPage(RouteConfig.mainPage, null), //作为默认页面
      onGenerateRoute: (RouteSettings settings) {
        //ios页面切换风格
        return CupertinoPageRoute(builder: (BuildContext context) {
          return RouteConfig.routes.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}