import 'package:book_manager/shared/util.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppButtonSocial extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final String pathIcon;
  final TextInputType textInputType;
  final TextStyle textStyle;
  final VoidCallback? onPressed;

  const AppButtonSocial({
    required this.text,
    required this.pathIcon,
    required this.backgroundColor,
    required this.onPressed,
    required this.textStyle,
    this.textInputType = TextInputType.text,
  });

  @override
  _AppButtonSocialState createState() => _AppButtonSocialState();
}

class _AppButtonSocialState extends State<AppButtonSocial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil.getInstance().getWidth(dimen_08)),
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: widget.backgroundColor,
        borderRadius:
            BorderRadius.circular(ScreenUtil.getInstance().getWidth(dimen_08)),
      ),
      child: InkWell(
        onTap: widget.onPressed,
        child: Row(
          children: [
            SvgPicture.asset(
              widget.pathIcon,
              width: ScreenUtil.getInstance().getWidth(dimen_24),
              height: ScreenUtil.getInstance().getWidth(dimen_24),
              color: AppColor.white,
            ),
            SizedBox(
              width: ScreenUtil.getInstance().getWidth(dimen_08),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style: widget.textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
