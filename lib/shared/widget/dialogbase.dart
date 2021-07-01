import 'package:flutter/material.dart';

class DialogBase extends StatefulWidget {
  final String title;
  final double titleSize;
  final Color titleColor;
  final String descriptions;
  final double descriptionsSize;
  final Color descriptionsColor;
  final bool isImage;
  final String pathImage;
  final bool isShowTopBorder, isShowRightBorder, isShowLeftBorder;
  final bool isShowButton1, isShowButton2, isShowButton3;
  final String? textButton1, textButton2, textButton3;
  final VoidCallback? onButton1, onButton2, onButton3;
  final Color textColorButton1, textColorButton2, textColorButton3;

  DialogBase({
    required this.title,
    this.titleSize = 20.0,
    this.titleColor = const Color(0xFF1C1C1E),
    required this.descriptions,
    this.descriptionsSize = 14.0,
    this.descriptionsColor = const Color(0xFF636366),
    this.isImage = false,
    this.pathImage = '',
    this.isShowLeftBorder = false,
    this.isShowRightBorder = false,
    this.isShowTopBorder = true,
    this.isShowButton1 = true,
    this.isShowButton2 = false,
    this.isShowButton3 = false,
    this.onButton1,
    this.onButton2,
    this.onButton3,
    this.textButton1,
    this.textButton2,
    this.textButton3,
    this.textColorButton1 = const Color(0xFF636366),
    this.textColorButton2 = const Color(0xFF636366),
    this.textColorButton3 = const Color(0xFF636366),
  });

  @override
  _DialogBaseState createState() => _DialogBaseState();
}

class _DialogBaseState extends State<DialogBase> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            widget.isImage
                ? Image.asset(
                    widget.pathImage,
                    width: 56.0,
                    height: 56.0,
                  )
                : Container(),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: widget.titleSize,
                fontWeight: FontWeight.w600,
                color: widget.titleColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.descriptions,
              style: TextStyle(
                fontSize: widget.descriptionsSize,
                fontWeight: FontWeight.w300,
                color: widget.descriptionsColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: 48,
              child: Row(
                children: [
                  Visibility(
                    visible: widget.isShowButton1,
                    child: Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: widget.onButton1,
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: widget.isShowTopBorder ? 1 : 0,
                                color: widget.isShowTopBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                              right: BorderSide(
                                width: widget.isShowRightBorder ? 0.5 : 0,
                                color: widget.isShowRightBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                              left: BorderSide(
                                width: widget.isShowLeftBorder ? 0.5 : 0,
                                color: widget.isShowLeftBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            widget.textButton1!,
                            style: TextStyle(
                              color: widget.textColorButton1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.isShowButton2,
                    child: Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: widget.onButton2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: widget.isShowTopBorder ? 1 : 0,
                                color: widget.isShowTopBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                              right: BorderSide(
                                width: widget.isShowRightBorder ? 0.5 : 0,
                                color: widget.isShowRightBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                              left: BorderSide(
                                width: widget.isShowLeftBorder ? 0.5 : 0,
                                color: widget.isShowLeftBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                            ),
                          ),
                          height: 48.0,
                          alignment: Alignment.center,
                          child: Text(
                            widget.textButton2!,
                            style: TextStyle(
                              color: widget.textColorButton2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.isShowButton3,
                    child: Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: widget.onButton3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: widget.isShowTopBorder ? 1 : 0,
                                color: widget.isShowTopBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                              right: BorderSide(
                                width: widget.isShowRightBorder ? 0.5 : 0,
                                color: widget.isShowRightBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                              left: BorderSide(
                                width: widget.isShowLeftBorder ? 0.5 : 0,
                                color: widget.isShowLeftBorder
                                    ? Color(0xFF000000)
                                    : Color(0x00FFFFFF),
                              ),
                            ),
                          ),
                          height: 48.0,
                          alignment: Alignment.center,
                          child: Text(
                            widget.textButton3!,
                            style: TextStyle(
                              color: widget.textColorButton3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
