import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sec1_gr21/util/mappicker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>?> openDialog(BuildContext context) async {
  final TextEditingController worknameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController additionController = TextEditingController();
  LatLng? selectedLatLng;
  return showDialog<Map<String, dynamic>>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('จ้างงาน',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTextField("งานที่ต้องการจ้าง", worknameController),
            buildTextField("ชื่อ", nameController),
            buildTextField("อายุ", ageController, isNumber: true),
            Container(
              width: 270,
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "ที่อยู่",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 270,
              height: 45,
              child: TextField(
                controller: locationController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "กรุณาเลือกจากแผนที่",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final LatLng? picked = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPickerPage()),
                );
                if (picked != null) {
                  selectedLatLng = picked;
                  final address = await getAddressFromLatLng(picked);
                  if (address != null) {
                    locationController.text = address; // 👈 ใส่ที่อยู่ในช่อง
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "เลือกตำแหน่งแล้ว: ${picked.latitude}, ${picked.longitude}"),
                  ));
                }
              },
              child: Text("เลือกตำแหน่งจากแผนที่"),
            ),
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
                'age': int.tryParse(ageController.text) ?? 0,
                'location': selectedLatLng != null
                    ? GeoPoint(
                        selectedLatLng!.latitude, selectedLatLng!.longitude)
                    : null,
                'locationName': locationController.text,
                'addition': additionController.text,
              });
            },
            child: const Text("ส่ง")),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("ยกเลิก"),
        ),
      ],
    ),
  );
}

Future<String?> getAddressFromLatLng(LatLng position) async {
  final apiKey =
      "AIzaSyDghrgdDky6s9-LqKYqsLqg7IaWshQb5CM"; // 🔐 ใส่ Key ที่มี Geocoding API
  final url =
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    if (jsonData['results'] != null && jsonData['results'].isNotEmpty) {
      return jsonData['results'][0]['formatted_address'];
    }
  }

  return null;
}

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
