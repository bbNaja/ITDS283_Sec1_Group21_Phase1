import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/route/router.dart';
import 'package:sec1_gr21/components/forchatpage.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class ChatPage extends StatefulWidget {
  final ThemeManager themeManager;

  const ChatPage({Key? key, required this.themeManager}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        themeManager: themeManager,
      ),
      body: Forchatpage(
        themeManager: themeManager,
      ),
    );
  }
}
