import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget buildTextField(String label, TextEditingController controller,
    {bool isNumber = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 270,
        margin: EdgeInsets.only(top: 10),
        child: Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        width: 270,
        height: 45,
        child: TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          ),
        ),
      ),
    ],
  );
}

Future<Map<String, dynamic>?> openDialogfindjob(BuildContext context) async {
  final TextEditingController worknameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController additionController = TextEditingController();
  final TextEditingController minwageController = TextEditingController();

  String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
  String selectedWorkType = 'once'; //Default val

  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
              title: Text('หางาน',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTextField("งานที่ต้องการหา", worknameController),
                    buildTextField("ชื่อ", nameController),
                    SizedBox(height: 10),
                    Container(
                        width: 270,
                        alignment: Alignment.centerLeft,
                        child: Text("ประเภทงาน",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    Container(
                      width: 270,
                      child: DropdownButtonFormField<String>(
                        value: selectedWorkType,
                        items: [
                          DropdownMenuItem(
                              value: 'hourly', child: Text('รายชั่วโมง')),
                          DropdownMenuItem(
                              value: 'once', child: Text('ครั้งเดียว')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedWorkType = value!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ),
                    if (selectedWorkType == 'hourly') ...[
                      SizedBox(height: 10),
                      buildTextField("รายได้ขั้นต่ำต่อชม. ", minwageController,
                          isNumber: true),
                    ],
                    SizedBox(height: 10),
                    buildTextField("รายละเอียดเพิ่มเติม", additionController),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop({
                      'workname': worknameController.text,
                      'name': nameController.text,
                      'worktype': selectedWorkType,
                      'minwage': selectedWorkType == 'hourly'
                          ? minwageController.text
                          : null,
                      'addition': additionController.text,
                      'userId': currentUserId,
                    });
                  },
                  child: const Text("ส่ง"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("ยกเลิก"),
                ),
              ]);
        });
      });
}
