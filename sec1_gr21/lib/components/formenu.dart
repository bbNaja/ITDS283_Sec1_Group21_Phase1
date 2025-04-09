import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class Formenu extends StatelessWidget {
  final ThemeManager themeManager;

  const Formenu({
    Key? key,
    required this.themeManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem("หางาน", "assets/logo.jpg"),
      MenuItem("จ้างงาน", "assets/logo.jpg"),
      MenuItem("เรียนรู้สิ่งใหม่", "assets/logo.jpg"),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: menuItems.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      color: Colors.white.withOpacity(0.6),
                      colorBlendMode: BlendMode.lighten,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String imagePath;

  MenuItem(this.title, this.imagePath);
}
