import 'package:flutter/material.dart';
import 'package:sec1_gr21/components/forfindjob.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/route/router.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class FindJobPage extends StatefulWidget {
  const FindJobPage({Key? key, required this.themeManager}) : super(key: key);
  final ThemeManager themeManager;

  @override
  _FindJobPageState createState() => _FindJobPageState();
}

class _FindJobPageState extends State<FindJobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        themeManager: themeManager,
      ),
      body: Forfindjob(
        themeManager: themeManager,
      ),
    );
  }
}
