import 'package:book_manager/shared/app_color.dart';
import 'package:book_manager/shared/dimen.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class TxtStyle {
  static TextStyle normal() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      fontWeight: FontWeight.w400,
      color: AppColor.white,
    );
  }

  static TextStyle text600Size14Blue() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_14),
      fontWeight: FontWeight.w600,
      color: AppColor.systemColorBlue,
    );
  }

  static TextStyle textBlue() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      fontWeight: FontWeight.w400,
      color: AppColor.systemColorBlue,
    );
  }

  static TextStyle text600Size16Blue() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      fontWeight: FontWeight.w600,
      color: AppColor.systemColorBlue,
    );
  }

  static TextStyle textGrey() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      fontWeight: FontWeight.w400,
      color: AppColor.grey,
    );
  }

  static TextStyle textFieldGrey() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      fontWeight: FontWeight.w400,
      color: AppColor.grey10,
    );
  }

  static TextStyle textFieldHintGrey() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      fontWeight: FontWeight.w400,
      color: AppColor.grey06,
    );
  }

  static TextStyle textLabelGrey() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_12),
      fontWeight: FontWeight.w400,
      color: AppColor.grey10,
    );
  }

  static TextStyle text400Size16Grey() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      fontWeight: FontWeight.w400,
      color: AppColor.grey,
    );
  }

  static TextStyle textError() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_12),
      fontWeight: FontWeight.w400,
      color: AppColor.systemColorRed,
    );
  }

  static TextStyle text400Size14Black() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_14),
      color: AppColor.back,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle text400Size16Black() {
    return TextStyle(
      fontSize: ScreenUtil.getInstance().getSp(dimen_16),
      color: AppColor.back,
      fontWeight: FontWeight.w400,
    );
  }
}
