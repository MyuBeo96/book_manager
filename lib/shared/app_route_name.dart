import 'package:book_manager/module/login/login.dart';
import 'package:flutter/material.dart';

class AppRouteName {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteName.login: (context) => LoginScreen(),
      RouteName.signUp: (context) => SignUpScreen(),
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
}
