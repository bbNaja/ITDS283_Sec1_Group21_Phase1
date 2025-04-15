import 'package:flutter/material.dart';

class Workexp extends StatelessWidget {
  Workexp({super.key});

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
  ]; //add firebase

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
    );
  }
}
