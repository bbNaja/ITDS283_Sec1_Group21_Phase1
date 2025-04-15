import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/route/router.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';
import 'package:sec1_gr21/components/forhirejob.dart';

class HireJobPage extends StatefulWidget {
  const HireJobPage({Key? key}) : super(key: key);

  @override
  _HireJobPageState createState() => _HireJobPageState();
}

class _HireJobPageState extends State<HireJobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Forhirejob(),
    );
  }
}
