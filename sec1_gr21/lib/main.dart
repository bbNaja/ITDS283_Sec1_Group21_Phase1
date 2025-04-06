import 'package:flutter/material.dart';
import 'pages/login/login.dart';
import 'pages/login/register.dart';
import 'pages/homepage.dart';
import 'pages/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcomepage(),
        '/login': (context) => Loginpage(),
        '/home': (context) => Homepage(),
        '/register': (context) => Registerpage(),
      },
    );
  }
}
