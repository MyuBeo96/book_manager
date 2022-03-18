import 'package:book_manager/shared/util.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String text;
  final TextInputType textInputType;
  final TextStyle textStyle;
  final VoidCallback? onPressed;

  const AppButton({
    required this.text,
    required this.onPressed,
    this.textInputType = TextInputType.text,
    required this.textStyle,
  });

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil.getInstance().getWidth(dimen_16)),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColor.systemColorBlue,
        borderRadius:
            BorderRadius.circular(ScreenUtil.getInstance().getWidth(dimen_50)),
      ),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: widget.textStyle,
          ),
        ),
      ),
    );
  }
}
