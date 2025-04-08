import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class Column extends StatelessWidget implements PreferredSizeWidget {
  // final bool showBackButton;
  final ThemeManager themeManager;

  const Column({
    Key? key,
    required this.themeManager,
    // this.showBackButton = true,
  }) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();

  @override
  Widget build(Object context) {
    // TODO: implement build

    throw UnimplementedError();
  }
}
