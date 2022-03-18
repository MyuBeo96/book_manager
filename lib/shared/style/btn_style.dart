import 'package:book_manager/shared/app_color.dart';
import 'package:book_manager/shared/dimen.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class BtnStyle {
  static TextStyle normal() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      color: AppColor.white,
    );
  }

  static TextStyle text600Size20() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_20),
      color: AppColor.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle text600Size24() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_24),
      color: AppColor.white,
      fontWeight: FontWeight.w600,
    );
  }
}
