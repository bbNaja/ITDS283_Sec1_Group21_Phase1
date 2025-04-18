import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profilename extends StatefulWidget {
  const Profilename({super.key});

  @override
  State<Profilename> createState() => _ProfilenameState();
}

class _ProfilenameState extends State<Profilename> {
  String name = '';
  int age = 0;
  String email = '';
  String address = '';

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        final data = doc.data();
        setState(() {
          name = data?['name'] ?? '';
          age = data?['age'] ?? 0;
          email = data?['email'] ?? '';
          address = data?['address'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 270,
          alignment: Alignment.centerLeft,
          child: Text(
            'Name: $name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 270,
          alignment: Alignment.centerLeft,
          child: Text(
            'Age: $age',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 270,
          alignment: Alignment.centerLeft,
          child: Text(
            'Address: $address',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 270,
          alignment: Alignment.centerLeft,
          child: Text(
            'Email: $email',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
