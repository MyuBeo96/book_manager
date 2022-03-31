import 'package:book_manager/shared/util.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String textHint;
  final String pathIcon;
  final TextInputType textInputType;
  final TextStyle textStyle;
  final bool isPassword;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validator;

  const AppTextField({
    required this.controller,
    required this.textHint,
    required this.pathIcon,
    required this.textStyle,
    this.onTap,
    this.onChange,
    this.validator,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode myFocusNode = new FocusNode();
  bool _isFocus = false;
  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        _isFocus = true;
      } else {
        _isFocus = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().getWidth(dimen_16)),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColor.white,
        border: Border.all(
          width: ScreenUtil.getInstance().getWidth(dimen_02),
          // ignore: unnecessary_null_comparison
          color: _setColor(),
        ),
        borderRadius:
            BorderRadius.circular(ScreenUtil.getInstance().getWidth(dimen_50)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.pathIcon,
            width: ScreenUtil.getInstance().getWidth(dimen_16),
            height: ScreenUtil.getInstance().getWidth(dimen_16),
            // ignore: unnecessary_null_comparison
            color: _setColor(),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().getWidth(dimen_08),
          ),
          Expanded(
            child: Container(
              child: TextFormField(
                controller: widget.controller,
                focusNode: myFocusNode,
                onTap: widget.onTap,
                onChanged: widget.onChange,
                decoration: InputDecoration(
                  hintText: widget.textHint,
                  hintStyle: TxtStyle.text400Size16Grey(),
                  border: InputBorder.none,
                ),
                validator: widget.validator,
                keyboardType: TextInputType.text,
                style: widget.textStyle,
                maxLines: 1,
                obscureText: widget.isPassword ? true : false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _setColor() {
    Color _color = AppColor.grey;
    if (widget.controller.text.isEmpty) {
      if (_isFocus) {
        _color = AppColor.systemColorBlue;
      } else {
        _color = AppColor.grey;
      }
    } else {
      _color = AppColor.systemColorBlue;
    }
    return _color;
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}
