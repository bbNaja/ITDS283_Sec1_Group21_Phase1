import 'package:flutter/material.dart';

Future openDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('หางาน',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildInput("งานที่ต้องการทำ", "งานที่ต้องการทำ"),
            buildInput("ชื่อ", "ชื่อ"),
            buildInput("อายุ", "อายุ", isNumber: true),
            buildInput("ที่อยู่", "ที่อยู่"),
            buildInput("รายละเอียดเพิ่มเติม", "รายละเอียดเพิ่มเติม"),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () {}, child: const Text("ส่ง")),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("ยกเลิก"),
        ),
      ],
    ),
  );
}

Widget buildInput(String label, String hint, {bool isNumber = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        SizedBox(
          width: 270,
          height: 45,
          child: TextField(
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
