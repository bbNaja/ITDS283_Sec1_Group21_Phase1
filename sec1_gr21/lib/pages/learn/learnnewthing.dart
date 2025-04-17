import 'package:flutter/material.dart';

import 'package:sec1_gr21/components/appbar.dart';

import 'package:sec1_gr21/components/learn/courselength.dart';

import 'package:video_player/video_player.dart';
import 'package:sec1_gr21/components/learn/videoplayer.dart';

import 'package:sec1_gr21/pages/learn/courseinfo.dart';

class learnnewthingPage extends StatefulWidget {
  const learnnewthingPage({Key? key}) : super(key: key);

  @override
  _HireJobPageState createState() => _HireJobPageState();
}

class _HireJobPageState extends State<learnnewthingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(),
        // body: SingleChildScrollView(
        //     child: Column(
        //   children: [
        //     Text('learning new thing page'),
        //   ],
        // ))
        body: CourseinfoPage());
  }
}
