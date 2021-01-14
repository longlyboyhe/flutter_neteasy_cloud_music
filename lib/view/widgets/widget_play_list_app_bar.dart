import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/image/image_util.dart';
import 'package:flutter_netease_cloud_music/view/widgets/widget_music_list_header.dart';

import 'flexible_detail_bar.dart';

class PlayListAppBarWidget extends StatelessWidget {
  final double expandedHeight;
  final Widget content;
  final String backgroundImg;
  final String title;
  final double sigma;
  final PlayModelCallback playOnTap;
  final int count;

  PlayListAppBarWidget({
    @required this.expandedHeight,
    @required this.content,
    @required this.title,
    @required this.backgroundImg,
    this.sigma = 5,
    this.playOnTap,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: expandedHeight,
      pinned: true,
      elevation: 0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      bottom: MusicListHeader(
        onTap: playOnTap,
        count: count,
      ),
      flexibleSpace: FlexibleDetailBar(
        content: content,
        background: Stack(
          children: <Widget>[
            backgroundImg.startsWith('http')
                ? ImageUtil.showNetImage(
                    '$backgroundImg?param=200y200',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    backgroundImg,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: sigma,
                sigmaX: sigma,
              ),
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
