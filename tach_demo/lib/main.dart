import 'package:flutter/material.dart';
import 'package:tach_demo/auth/login.dart';
import 'package:tach_demo/auth/splash.dart';
import 'package:tach_demo/bottomNavigation/bottomNav.dart';
import 'package:tach_demo/loginPage/login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
      ),
      //home: new MyHomePage(title: 'Contacts'),
      home: new SplashPage()
    );
  }
}

