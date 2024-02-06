import 'package:deadlines/screens/dashboard_screen.dart';
import 'package:deadlines/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 36, 36, 36),
            appBarTheme: AppBarTheme(
                backgroundColor: Color.fromARGB(255, 26, 26, 26),
                foregroundColor: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: LoginScreen()
        // DashboardScreen(),
        );
  }
}
