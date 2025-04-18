import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/components/profile/workexp.dart';
import 'package:sec1_gr21/components/profile/profilename.dart';
import 'package:sec1_gr21/util/storage_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchImages();
  // }

  // Future<void> fetchImages() async {
  //   await Provider.of<StorageService>(context, listen: false).fetchImages();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Consumer<StorageService>(
  //     builder: (context, storageService, child) {
  //       final List<String> imageUrls = storageService.imageUrls;

  //       return Scaffold(
  //           floatingActionButton: FloatingActionButton(
  //             onPressed: () => storageService.uploadImage(),
  //             child: const Icon(Icons.add),
  //           ),
  //           body: ListView.builder(itemBuilder: (context, index) {
  //             final String imageUrl = imageUrls[index];
  //             return Image.network(imageUrl);
  //           }));
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
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
                      icon: const Icon(Icons.edit, color: Colors.grey),
                      iconSize: 32,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, editprofilepageRoute);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, editprofilepageRoute);
                    },
                    icon: const Icon(Icons.edit, color: Colors.black),
                    label: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
              const SizedBox(height: 20),
              Container(child: Profilename()),
              const SizedBox(height: 30),
              Container(child: Workexp()),
              const SizedBox(height: 40),
              Center(
                  child: TextButton.icon(
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, loginpageRoute);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
