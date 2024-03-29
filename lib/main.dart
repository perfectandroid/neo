import 'package:flutter/material.dart';
import 'package:neo/Screens/Login/loginpage.dart';
import 'package:neo/Screens/SplashScreen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //home: LoginPage(),
    );
  }
}

