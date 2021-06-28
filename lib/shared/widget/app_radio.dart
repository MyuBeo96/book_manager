import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';

class AppRadio<T> extends StatefulWidget {
  final String value;
  final String groupValue;
  final Widget? title;
  final ValueChanged<T?>? onChanged;

  final Color activeColor;
  final Color inactiveColor;
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final double horizontalTitleGap;

  const AppRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.textStyle = const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    this.textOverflow = TextOverflow.fade,
    this.activeColor = const Color(0xFF0066FF),
    this.inactiveColor = const Color(0xFF8E8E93),
    this.horizontalTitleGap = 20.0,
  });

  @override
  _AppRadioState createState() => _AppRadioState();
}

class _AppRadioState extends State<AppRadio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (widget.onChanged == null) {
            return;
          } else {
            widget.onChanged!(widget.value);
          }
        },
        child: Row(
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: (widget.value == widget.groupValue)
                      ? widget.activeColor
                      : widget.inactiveColor,
                  width: dimen_02,
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                      color: (widget.value == widget.groupValue)
                          ? widget.activeColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(60.0)),
                ),
              ),
            ),
            SizedBox(
              width: widget.horizontalTitleGap,
            ),
            Expanded(
              child: widget.title!,
            ),
          ],
        ),
      ),
    );
  }
}
