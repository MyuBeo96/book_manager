import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppInputField extends StatefulWidget {
  final TextEditingController controller;
  final String textHint;
  final String pathIconLeft;
  final String pathIconRight;
  final TextInputType textInputType;
  final TextStyle textStyle;
  final bool isImageLeft;
  final bool isImageRight;
  final GestureTapCallback? onTap;
  final bool isColorError;

  const AppInputField({
    required this.controller,
    required this.textHint,
    this.pathIconLeft = '',
    this.pathIconRight = '',
    required this.textStyle,
    this.onTap,
    this.textInputType = TextInputType.text,
    this.isImageLeft = false,
    this.isImageRight = false,
    this.isColorError = false,
  });

  @override
  _AppInputFieldState createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  FocusNode myFocusNode = new FocusNode();
  bool _isFocus = false;
  bool isPasswordShowing = false;
  bool isPassword = false;
  TextBloc _textBloc = TextBloc();

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
    if (widget.textInputType == TextInputType.visiblePassword) {
      isPassword = true;
    } else {
      isPassword = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _textBloc.textStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColor.white,
                    border: Border(
                      bottom: BorderSide(
                        color: _setColor(
                          isError: snapshot.hasError,
                          colorError: widget.isColorError,
                        ),
                        width: dimen_02,
                      ),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (_isFocus || widget.controller.text.isNotEmpty)
                        ? Row(
                            children: [
                              Text(
                                widget.textHint,
                                style: (widget.isColorError &&
                                        snapshot.hasError &&
                                        _isFocus)
                                    ? TxtStyle.textError()
                                    : TxtStyle.textLabelGrey(),
                              ),
                            ],
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.isImageLeft
                            ? Row(
                                children: [
                                  SvgPicture.asset(
                                    widget.pathIconLeft,
                                    width: dimen_16,
                                    height: dimen_16,
                                    color: AppColor.grey06,
                                  ),
                                  SizedBox(
                                    width: dimen_16,
                                  ),
                                ],
                              )
                            : Container(),
                        Expanded(
                          child: TextFormField(
                            onChanged: (String text) => _textBloc.updateText(
                                text: text,
                                textError: 'Không được để trống!!!'),
                            controller: widget.controller,
                            focusNode: myFocusNode,
                            onTap: widget.onTap,
                            decoration: InputDecoration(
                              hintText: widget.textHint,
                              hintStyle: TxtStyle.textFieldHintGrey(),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.text,
                            style: widget.textStyle,
                            maxLines: 1,
                            obscureText: isPasswordShowing ? false : isPassword,
                          ),
                        ),
                        _widgetClear(widget.controller.text),
                        Visibility(
                          visible: isPassword,
                          child: SvgPicture.asset(
                            widget.pathIconRight,
                            width: dimen_16,
                            height: dimen_16,
                            color: AppColor.grey,
                          ),
                        ),
                        Visibility(
                          visible: isPassword,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPasswordShowing = !isPasswordShowing;
                                  });
                                },
                                child: SvgPicture.asset(
                                  isPasswordShowing
                                      ? PathConstant.eyeShowPassword
                                      : PathConstant.eyeHidePassword,
                                  color: AppColor.grey06,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: dimen_06,
              ),
              snapshot.hasError
                  ? Text(
                      snapshot.error.toString(),
                      style: TxtStyle.textError(),
                    )
                  : Container(),
            ],
          );
        });
  }

  Color _setColor({
    bool colorError = false,
    bool isError = false,
  }) {
    Color _color = AppColor.grey06;
    if (!_isFocus) {
      _color = AppColor.grey06;
    } else {
      if (colorError && isError) {
        _color = AppColor.systemColorRed;
      } else {
        _color = AppColor.systemColorBlue;
      }
    }
    return _color;
  }

  Widget _widgetClear(String textField) {
    // ignore: unnecessary_null_comparison
    if (textField.isEmpty || textField == '' || textField == null) {
      return Container();
    } else {
      return GestureDetector(
        onTap: () {
          _textBloc.updateText(text: textField);
          widget.controller.clear();
          
        },
        child: SvgPicture.asset(
          PathConstant.clearIconPath,
          width: dimen_16,
          height: dimen_16,
          color: AppColor.grey06,
        ),
      );
    }
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }
}
