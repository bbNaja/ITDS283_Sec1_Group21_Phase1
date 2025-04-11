import 'package:flutter/material.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';
import 'package:sec1_gr21/route/route_constant.dart';

class Forprofile extends StatefulWidget {
  final ThemeManager themeManager;

  const Forprofile({
    Key? key,
    required this.themeManager,
  }) : super(key: key);

  @override
  _Forprofilestate createState() => _Forprofilestate();
}

class _Forprofilestate extends State<Forprofile> {
  final List<Map<String, String>> jobExperiences = [
    {'title': 'ศิลป/วาดภาพ', 'duration': '4 ปี'},
    {'title': 'เขียนโปรแกรม', 'duration': '3 ปี'},
    {'title': 'ออกแบบกราฟิก', 'duration': '2 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '1 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
    {'title': 'ตัดต่อวิดีโอ', 'duration': '5 ปี'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  const CircleAvatar(
                    radius: 70,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      iconSize: 32,
                      onPressed: () {
                        Navigator.pushNamed(context, editprofilepageRoute);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Container(
                width: 270,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ชื่อ: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 270,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'อายุ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 270,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ที่อยู่',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 270,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Username: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 30),

              // งานประวัติการทำงาน
              Container(
                width: 270,
                alignment: Alignment.centerLeft,
                child: const Text(
                  'ประวัติการทำงาน',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              ...List.generate(jobExperiences.length, (index) {
                final job = jobExperiences[index];
                return Column(
                  children: [
                    _buildJobExperienceCard(job['title']!, job['duration']!),
                    const SizedBox(height: 10),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobExperienceCard(String title, String duration) {
    return Container(
      width: 270,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(duration),
        ],
      ),
    );
  }

  Widget _buildGrayPlaceholderBox() {
    return Container(
      width: 270,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
