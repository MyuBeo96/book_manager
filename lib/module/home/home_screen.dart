import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hybrid Theme'),
      ),
      body: Row(
        children: [
          // Container(
          //   // ignore: deprecated_member_use
          //   child: FlatButton(
          //     onPressed: () => {
          //       theme.setLightMode(),
          //     },
          //     child: Text('Set Light Theme'),
          //   ),
          // ),
          // Container(
          //   // ignore: deprecated_member_use
          //   child: FlatButton(
          //     onPressed: () => {
          //       theme.setDarkMode(),
          //     },
          //     child: Text('Set Dark theme'),
          //   ),
          // ),
          // Container(
          //   // ignore: deprecated_member_use
          //   child: FlatButton(
          //     onPressed: () {
          //       Navigator.popAndPushNamed(context, RouteName.camera);
          //     },
          //     child: Text('Camera'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
