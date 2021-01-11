import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/app/utils/ui/ui_adapter.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: setSp(32),
  );
}
