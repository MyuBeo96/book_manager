import 'package:book_manager/module/home/home.dart';
import 'package:book_manager/module/login/login.dart';
import 'package:book_manager/module/main.dart';
import 'package:book_manager/shared/widget/camera_screen.dart';
import 'package:flutter/material.dart';

class AppRouteName {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteName.login: (context) => LoginScreen(),
      RouteName.signUp: (context) => SignUpScreen(),
      RouteName.home: (context) => HomeScreen(),
      RouteName.myMain: (context) => MyMain(),
      RouteName.camera: (context) => CameraScreen(),
    };
  }
}

class CombinedRoutes {
  static Map<String, WidgetBuilder> _getCombinedRoutes() => {
        ...AppRouteName.getAll(),
      };

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}

class RouteName {
  static final String login = '/login';
  static final String signUp = '/signUp';
  static final String myMain = '/myMain';
  static final String home = '/home';
  static final String camera = '/camera';
}
