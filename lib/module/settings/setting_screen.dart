import 'package:book_manager/shared/widget/mobile_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileScreen(
      child: Center(
        child: Text("Setting"),
      ),
    );
  }
}
