import 'package:sec1_gr21/util/authcheck.dart';

import 'route/route_constant.dart';
import 'route/router.dart' as router;
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeWork',
      home: AuthCheck(),
      //default
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: welcomepageRoute,
    );
  }
}
