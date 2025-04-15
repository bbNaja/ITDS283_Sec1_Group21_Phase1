import 'package:flutter/material.dart';
import 'package:sec1_gr21/components/forfindjob.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/route/router.dart';

class FindJobPage extends StatefulWidget {
  const FindJobPage({Key? key}) : super(key: key);

  @override
  _FindJobPageState createState() => _FindJobPageState();
}

class _FindJobPageState extends State<FindJobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Forfindjob(),
    );
  }
}
