import 'package:book_manager/shared/util.dart';
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

  const AppTextField({
    required this.controller,
    required this.textHint,
    required this.pathIcon,
    required this.textStyle,
    this.onTap,
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
      padding: const EdgeInsets.symmetric(horizontal: dimen_16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColor.white,
        border: Border.all(
          width: dimen_02,
          // ignore: unnecessary_null_comparison
          color: _setColor(),
        ),
        borderRadius: BorderRadius.circular(dimen_50),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            widget.pathIcon,
            width: dimen_16,
            height: dimen_16,
            // ignore: unnecessary_null_comparison
            color: _setColor(),
          ),
          SizedBox(
            width: dimen_16,
          ),
          Expanded(
            child: Container(
              child: TextFormField(
                controller: widget.controller,
                focusNode: myFocusNode,
                onTap: widget.onTap,
                decoration: InputDecoration(
                  hintText: widget.textHint,
                  hintStyle: TextStyle(
                    fontSize: dimen_16,
                    color: AppColor.grey,
                  ),
                  border: InputBorder.none,
                ),
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
