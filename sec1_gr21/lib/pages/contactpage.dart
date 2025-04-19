import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sec1_gr21/pages/chatpage/msgpage.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/components/profile/workexp.dart';
import 'package:sec1_gr21/components/profile/profilename.dart';
import 'package:sec1_gr21/util/storage_service.dart';

class Contactpage extends StatefulWidget {
  final String userId;
  final String userName;

  const Contactpage({
    Key? key,
    required this.userId, // Add the required parameter for userId
    required this.userName, // Add the required parameter for userName
  }) : super(key: key);

  @override
  State<Contactpage> createState() => _ContactPageState();
}

class _ContactPageState extends State<Contactpage> {
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
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                    onPressed: () {
                      if (widget.userId.isNotEmpty) {
                        // Make sure the userId is not empty before navigating
                        Navigator.push(
                          //push into msg page individual profile
                          context,
                          MaterialPageRoute(
                            builder: (context) => Msgpage(
                              recieverEmail: widget.userName,
                              recieverID: widget.userId,
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.chat, color: Colors.black),
                    label: const Text(
                      'Chat',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
              const SizedBox(height: 20),
              Container(child: Profilename(userId: widget.userId)),
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
