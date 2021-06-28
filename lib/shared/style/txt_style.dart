import 'package:book_manager/shared/app_color.dart';
import 'package:book_manager/shared/dimen.dart';
import 'package:flutter/material.dart';

class TxtStyle {
  static TextStyle normal() {
    return TextStyle(
      fontSize: dimen_16,
      fontWeight: FontWeight.w400,
      color: AppColor.white,
    );
  }

  static TextStyle textBlue() {
    return TextStyle(
      fontSize: dimen_16,
      fontWeight: FontWeight.w400,
      color: AppColor.systemColorBlue,
    );
  }

  static TextStyle textGrey() {
    return TextStyle(
      fontSize: dimen_16,
      fontWeight: FontWeight.w400,
      color: AppColor.grey,
    );
  }

  static TextStyle textFieldGrey() {
    return TextStyle(
      fontSize: dimen_16,
      fontWeight: FontWeight.w400,
      color: AppColor.grey10,
    );
  }

  static TextStyle textFieldHintGrey() {
    return TextStyle(
      fontSize: dimen_16,
      fontWeight: FontWeight.w400,
      color: AppColor.grey06,
    );
  }

  static TextStyle textLabelGrey() {
    return TextStyle(
      fontSize: dimen_12,
      fontWeight: FontWeight.w400,
      color: AppColor.grey10,
    );
  }

  static TextStyle textError() {
    return TextStyle(
      fontSize: dimen_12,
      fontWeight: FontWeight.w400,
      color: AppColor.systemColorRed,
    );
  }
}
