import 'package:flutter/material.dart';

class Welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          // This centers everything in the body
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Makes Column take minimal vertical space
            children: [
              Text(
                'welcome to หางานให้ผู้สูงอายุ',
                style: TextStyle(fontSize: 20), // Optional: add styling
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  Navigator.pushNamed(context, '/loginpage');
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text("Register"),
                onPressed: () {
                  Navigator.pushNamed(context, '/registerpage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
