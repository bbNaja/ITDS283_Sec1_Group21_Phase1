import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/model/menuitem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final auth = FirebaseAuth.instance;
  String userName = "";

  final List<MenuItem> formenu = [
    MenuItem("หางาน", "assets/logo.jpg", findjobpageRoute),
    MenuItem("จ้างงาน", "assets/findwork.jpg", hirejobpageRoute),
    // MenuItem("เรียนรู้สิ่งใหม่", "assets/logo.jpg",courseinfoRoute), //change to learnnewthing later
    MenuItem("เรียนรู้สิ่งใหม่", "assets/logo.jpg",
        learnnewthingpageRoute), //change to learnnewthing later
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    final user = auth.currentUser;

    if (user?.uid != null) {
      final doc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user?.uid)
          .get();
      print("User found: ${doc.data()}");
      if (doc.exists) {
        setState(() {
          userName = doc.data()?['name'] ?? 'Guest';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final fullEmail = auth.currentUser?.displayName ?? "Guest";
    // final userEmail = fullEmail.split('@').first; //only name before @ in email
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NavBar(
          showBackButton: false, // เพื่อเอาปุ่มย้อนกลับออก
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 9, left: 18, right: 16, bottom: 30),
                child: Text(
                  'Welcome, $userName',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...formenu.map((item) {
                //MenuItem
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, item.route);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 90,
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Image.asset(
                                  item.imagePath,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.white.withOpacity(0.8),
                                  colorBlendMode: BlendMode.lighten,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontSize: 29,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 40),
              Center(
                  child: TextButton.icon(
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                onPressed: () async {
                  await auth.signOut();
                  Navigator.pushReplacementNamed(context, welcomepageRoute);
                },
              ))
            ],
          ),
        )));
  }
}
