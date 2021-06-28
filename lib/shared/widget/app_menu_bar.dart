import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';

class AppMenuBar extends StatefulWidget {
  final String title;

  const AppMenuBar({
    required this.title,
  });

  @override
  _AppMenuBarState createState() => _AppMenuBarState();
}

class _AppMenuBarState extends State<AppMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColor.systemColorBlue,
      ),
      height: dimen_100,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Text('data'),
        ],
      ),
    );
  }
}
