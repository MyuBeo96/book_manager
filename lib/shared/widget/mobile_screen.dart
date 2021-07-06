import 'package:book_manager/module/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatefulWidget {
  final Widget child;
  const MobileScreen({
    required this.child,
  });

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        home: Scaffold(
          body: widget.child,
        ),
      ),
    );
  }
}
