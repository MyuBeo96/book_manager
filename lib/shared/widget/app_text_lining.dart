import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';

class AppTextLining extends StatefulWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double textSize;
  final VoidCallback? onPressed;

  const AppTextLining({
    required this.text,
    required this.textColor,
    this.fontWeight = FontWeight.w400,
    this.textSize = text_size_16,
    required this.onPressed,
  });

  @override
  _AppTextLiningState createState() => _AppTextLiningState();
}

class _AppTextLiningState extends State<AppTextLining> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.textColor,
          fontWeight: widget.fontWeight,
          fontSize: widget.textSize,
        ),
      ),
    );
  }
}
