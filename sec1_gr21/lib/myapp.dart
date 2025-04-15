import 'package:sec1_gr21/pages/authcheck.dart';
import 'package:sec1_gr21/theme/theme_constant.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';
import 'route/route_constant.dart';
import 'route/router.dart' as router;
import 'package:flutter/material.dart';

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    // TODO: implement initState
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeWork',
      home: AuthCheck(),
      theme: lightTheme, //default
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: welcomepageRoute,
    );
  }
}
