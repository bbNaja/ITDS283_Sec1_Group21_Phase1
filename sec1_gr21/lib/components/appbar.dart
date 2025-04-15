import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';
import 'package:sec1_gr21/route/route_constant.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const NavBar({
    Key? key,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // เอาไว้ดูปุ่มย้อนกลับ
      backgroundColor: Colors.white,
      elevation: 2,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
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
            Navigator.pushNamed(context, chatpageRoute);
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
            Navigator.pushNamed(context, profilepageRoute);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
