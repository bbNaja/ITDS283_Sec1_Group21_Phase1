import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final ThemeManager themeManager;

  const NavBar({
    Key? key,
    required this.themeManager,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 2,
      // leading: showBackButton
      //     ? IconButton(
      //         icon: Icon(Icons.arrow_back, color: Colors.black),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       )
      //     : null,
      centerTitle: true,
      actions: [
        // Switch(
        //   value: themeManager.themeMode == ThemeMode.dark,
        //   onChanged: (newValue) {
        //     themeManager.toggleTheme(newValue);
        //   },
        // ),
        IconButton(
          icon: Icon(Icons.chat_bubble_outline, color: Colors.black),
          onPressed: () {
            // TODO: navigate to chat
          },
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.black),
          onPressed: () {
            // TODO: navigate to settings
          },
        ),
        IconButton(
          icon: Icon(Icons.account_circle_outlined, color: Colors.black),
          onPressed: () {
            // TODO: navigate to profile
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}