import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sec1_gr21/pages/login/login.dart';

import 'package:sec1_gr21/route/route_constant.dart';

class AuthCheck extends StatefulWidget {
  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  User? user;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    setState(() {
      user = FirebaseAuth.instance.currentUser;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (user == null) {
      return Loginpage();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, homepageRoute);
    });
    return const SizedBox.shrink();
  }
}
