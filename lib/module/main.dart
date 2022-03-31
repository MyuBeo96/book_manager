import 'package:book_manager/module/home/home.dart';
import 'package:book_manager/module/profile/profile.dart';
import 'package:book_manager/module/settings/setting.dart';
import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';

class MyMain extends StatefulWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  _MyMainState createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int selectedIndex = 0;
  Widget _myhome = HomeScreen();
  // Widget _myProfile = ProfileScreen();
  Widget _settingScreen = SettingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.getBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColor.systemColorBlue),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.systemColorBlue,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          selectedItemColor: AppColor.systemColorBlue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: 'Emails',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          onTap: (int index) {
            this.onTapHandler(index);
          },
        ),
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._myhome;
    } else if (this.selectedIndex == 1) {
      // return this._myProfile;
      // } else if (this.selectedIndex == 2) {
      //   return this._myEmails;
      return Container();
    } else {
      return this._settingScreen;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
