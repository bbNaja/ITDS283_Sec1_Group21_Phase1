import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';
import 'package:sec1_gr21/route/route_constant.dart';

class Forlearnnewthing extends StatefulWidget {
  const Forlearnnewthing({
    Key? key,
  }) : super(key: key);

  @override
  State<Forlearnnewthing> createState() => _Forlearningnewthingstate();
}

class _Forlearningnewthingstate extends State<Forlearnnewthing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Text('learning new thing page'),
        ],
      ),
    ));
  }
}
