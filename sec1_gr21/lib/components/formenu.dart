import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';
import 'package:sec1_gr21/route/route_constant.dart';

class Formenu extends StatefulWidget {
  final ThemeManager themeManager;

  const Formenu({
    Key? key,
    required this.themeManager,
  }) : super(key: key);

  @override
  State<Formenu> createState() => _FormenuState();
}

class _FormenuState extends State<Formenu> {
  final List<MenuItem> formenu = [
    MenuItem("หางาน", "assets/logo.jpg", findjobpageRoute),
    MenuItem("จ้างงาน", "assets/findwork.jpg", hirejobpageRoute),
    MenuItem("เรียนรู้สิ่งใหม่", "assets/logo.jpg", learnnewthingpageRoute),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 9, left: 18, right: 16, bottom: 30),
            child: Text(
              'Welcome, สมชาย',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...formenu.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, item.route);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Image.asset(
                              item.imagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.white.withOpacity(0.8),
                              colorBlendMode: BlendMode.lighten,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontSize: 29,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String imagePath;
  final String route;

  MenuItem(this.title, this.imagePath, this.route);
}
