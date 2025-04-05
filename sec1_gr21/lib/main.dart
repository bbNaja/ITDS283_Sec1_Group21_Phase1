import 'package:flutter/material.dart';
import 'login/loginpage.dart';
import 'login/registerpage.dart';
import 'homepage.dart';
import 'welcomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcomepage',
      routes: {
        '/': (context) => Welcomepage(),
        '/loginpage': (context) => Loginpage(),
        '/homepage': (context) => Homepage(),
        '/registerpage': (context) => Registerpage(),
      },
    );
  }
}
