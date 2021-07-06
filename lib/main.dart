import 'package:book_manager/module/login/login.dart';
import 'package:book_manager/module/theme/theme_manager.dart';
import 'package:book_manager/shared/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => new ThemeNotifier(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        home: LoginScreen(),
        routes: CombinedRoutes.getAll(),
      ),
    );
  }
}
