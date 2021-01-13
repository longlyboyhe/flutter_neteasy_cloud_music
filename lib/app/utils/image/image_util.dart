import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  static Widget showNetImage(String url,
      {double width, double height, BoxFit fit}) {
    return Image(
      image: ExtendedNetworkImageProvider(url, cache: true),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
