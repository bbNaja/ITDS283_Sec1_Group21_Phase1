import 'package:flutter/material.dart';
import 'package:sec1_gr21/route/route_constant.dart';
import 'package:sec1_gr21/theme/theme_manager.dart';

class Loginpage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Text('Login'),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                // Normally add auth logic here
                // Navigator.pushReplacementNamed(context, '/homepage');
                Navigator.pushNamed(context, homepageRoute);
              },
            ),
            TextButton(
              child: Text("Don't have an account? Register"),
              onPressed: () {
                Navigator.pushNamed(context, registerpageRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
