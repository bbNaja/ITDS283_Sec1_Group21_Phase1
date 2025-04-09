import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';

import 'package:sec1_gr21/components/formenu.dart';

import 'package:sec1_gr21/theme/theme_manager.dart';

class Homepage extends StatelessWidget {
  final ThemeManager themeManager;

  const Homepage({Key? key, required this.themeManager}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavBar(
        themeManager: themeManager,
      ),
      body: Formenu(
        themeManager: themeManager,
      ),
    );
  }
}
