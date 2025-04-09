import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';

import 'package:sec1_gr21/theme/theme_manager.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        themeManager: ThemeManager(),
      ),
      body: Center(
        child: Text('This is the Profile Page'),
      ),
    );
  }
}
