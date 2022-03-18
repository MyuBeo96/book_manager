import 'package:flutter/material.dart';

class AppTextLining extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  const AppTextLining({
    required this.text,
    required this.onPressed,
    this.textStyle,
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
        style: widget.textStyle,
      ),
    );
  }
}
