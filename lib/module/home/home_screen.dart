import 'package:book_manager/module/theme/theme_manager.dart';
import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hybrid Theme'),
          ),
          body: Row(
            children: [
              Container(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () => {
                    theme.setLightMode(),
                  },
                  child: Text('Set Light Theme'),
                ),
              ),
              Container(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () => {
                    theme.setDarkMode(),
                  },
                  child: Text('Set Dark theme'),
                ),
              ),
              Container(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, RouteName.camera);
                  },
                  child: Text('Camera'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
