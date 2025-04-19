import 'package:flutter/material.dart';
import 'package:sec1_gr21/pages/learn/courseinfo.dart';
import 'package:sec1_gr21/route/route_constant.dart';

class learnnewthingPage extends StatelessWidget {
  const learnnewthingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn New Things'),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff0f17ad).withOpacity(0.8),
                Color(0xFF6985e8).withOpacity(0.9),
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Choose a Course',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // List of courses
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: 3, // Adjust based on the number of courses
                  itemBuilder: (_, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the CourseInfo page
                        Navigator.pushNamed(context, courseinfoRoute);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.book,
                              color: Color(0xFF6985e8),
                              size: 40,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                'Career Training ${index + 1}', // Dynamic course name
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Color(0xFF6985e8),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
