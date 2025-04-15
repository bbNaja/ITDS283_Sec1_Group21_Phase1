import 'package:flutter/material.dart';

class Profilename extends StatelessWidget {
  const Profilename({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
      ],
    );
  }
}
