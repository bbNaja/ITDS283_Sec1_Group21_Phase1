import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/components/profile/profiletextfield.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  String? imageUrl;

  Future<void> updateProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('Users').doc(user.uid).set(
          {
            'name': nameController.text,
            'age': int.tryParse(ageController.text) ?? 0,
            'address': addressController.text,
            'phone': phoneController.text, //add in firebase
          },
          SetOptions(
              merge:
                  true)); //update only info that send not deleting the old one

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated!')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        final data = doc.data();
        imageUrl = data?['imageUrl'];

        setState(() {
          nameController.text = data?['name'] ?? '';
          ageController.text = (data?['age'] ?? '').toString();
          addressController.text = data?['address'] ?? '';
          phoneController.text = data?['phone'] ?? '';
        });
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(),
        resizeToAvoidBottomInset:
            true, // Allows the body to resize when keyboard appears

        body: SingleChildScrollView(
          // padding: const EdgeInsets.all(20.0),
          padding: const EdgeInsetsDirectional.symmetric(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          imageUrl != null ? NetworkImage(imageUrl!) : null,
                      child: imageUrl == null
                          ? const Icon(Icons.person, size: 60)
                          : null,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        iconSize: 32,
                        onPressed: () {
                          // for edit photo
                        },
                      ),
                    ),
                  ],
                ),
                ProfileTextField(
                  label: 'Name: ',
                  hint: 'Name',
                  controller: nameController,
                ),
                ProfileTextField(
                  label: 'Age: ',
                  hint: 'age',
                  controller: ageController,
                ),
                ProfileTextField(
                  label: 'Address: ',
                  hint: 'address',
                  controller: addressController,
                ),
                ProfileTextField(
                  label: 'Phone number: ',
                  hint: 'เบอร์โทรศัพท์',
                  controller: phoneController,
                ),
                const SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    onPressed: () {
                      updateProfile();
                      Navigator.pushReplacementNamed(context, profilepageRoute);
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20), // 👈 ช่องว่างระหว่างปุ่ม

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: StadiumBorder(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, profilepageRoute);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ));
  }
}
