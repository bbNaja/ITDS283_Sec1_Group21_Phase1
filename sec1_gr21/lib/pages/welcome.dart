import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Yellow area with logo
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  'assets/logo.jpg', // เปลี่ยนเป็นโลโก้ที่คุณใช้
                  width: 250,
                ),
              ),
            ),
          ),

          // LOG IN Button
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, loginpageRoute);
              },
              child: Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // SIGN UP Button
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, registerpageRoute);
              },
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
