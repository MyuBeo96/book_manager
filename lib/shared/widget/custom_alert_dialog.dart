import 'package:book_manager/shared/util.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.description,
    this.show2Button = false,
    this.onTap,
    this.textConfirm = 'Tiếp tục',
    this.textCancel = 'Huỷ bỏ',
  }) : super(key: key);

  final String title, description;
  final bool show2Button;
  final GestureTapCallback? onTap;
  final String? textConfirm, textCancel;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(ScreenUtil.getInstance().getWidth(dimen_15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: ScreenUtil.getInstance().getWidth(dimen_15)),
          Text(
            "${widget.title}",
            style: TxtStyle.text600Size16Black(),
          ),
          SizedBox(height: ScreenUtil.getInstance().getWidth(dimen_15)),
          Text(
            "${widget.description}",
            style: TxtStyle.text400Size14Black(),
          ),
          SizedBox(height: ScreenUtil.getInstance().getWidth(dimen_20)),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: ScreenUtil.getInstance().getWidth(dimen_50),
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: widget.onTap != null
                  ? widget.onTap
                  : () => Navigator.of(context).pop(),
              child: Center(
                child: Text(
                  widget.textConfirm!,
                  style: TxtStyle.text600Size16Blue(),
                ),
              ),
            ),
          ),
          Divider(
            height: ScreenUtil.getInstance().getWidth(dimen_01),
          ),
          Visibility(
            visible: widget.show2Button,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: ScreenUtil.getInstance().getWidth(dimen_50),
              child: InkWell(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                      ScreenUtil.getInstance().getWidth(dimen_15)),
                  bottomRight: Radius.circular(
                      ScreenUtil.getInstance().getWidth(dimen_15)),
                ),
                highlightColor: Colors.grey[200],
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: Text(widget.textCancel!,
                      style: TxtStyle.text600Size16Blue()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
