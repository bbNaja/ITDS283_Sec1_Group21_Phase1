import 'package:flutter/material.dart';
import 'route/route_constant.dart';
import 'route/router.dart' as router;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeWork',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: welcomepageRoute,
    );
  }
}
