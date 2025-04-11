import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/components/foreditprofile.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class EditProfilePage extends StatelessWidget {
  final ThemeManager themeManager;
  const EditProfilePage({Key? key, required this.themeManager})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        themeManager: themeManager,
      ),
      body: Foreditprofile(
        themeManager: themeManager,
      ),
    );
  }
}
