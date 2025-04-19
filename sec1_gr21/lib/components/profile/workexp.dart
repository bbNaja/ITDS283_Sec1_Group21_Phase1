import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Workexp extends StatelessWidget {
  final String? userId; // Accepting userId as a parameter

  Workexp({super.key, this.userId});
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  // Function to add a new job experience
  Future<void> _addJobExperience(context) async {
    final title = _titleController.text.trim();

    if (title.isNotEmpty) {
      final user = FirebaseAuth.instance.currentUser;
      final targetUserId = userId ?? user?.uid;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(targetUserId)
            .collection('job_experiences')
            .add({
          'title': _titleController.text,
          'duration': _durationController.text,
        });

        _titleController.clear();
        _durationController.clear();
      } else {
        const SnackBar(content: Text('Please fill in title'));
      }
    }
  }

  Widget _buildJobExperienceCard(String title, String duration) {
    return Container(
      width: 270,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(duration),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 270,
          alignment: Alignment.centerLeft,
          child: const Text(
            'ประวัติการทำงาน',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // StreamBuilder to listen for real-time changes in job experiences
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(userId ?? currentUserId)
              .collection('job_experiences')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('Error loading job experiences');
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Text('No job experiences added.');
            }

            final jobExperiences = snapshot.data!.docs;
            return Column(
              children: jobExperiences.map((doc) {
                final job = doc.data() as Map<String, dynamic>;
                return Column(
                  children: [
                    _buildJobExperienceCard(job['title'], job['duration']),
                    const SizedBox(height: 10),
                  ],
                );
              }).toList(),
            );
          },
        ),
        const SizedBox(height: 20),
        // Button to open a dialog and add new experience
        if (userId == null) //might not secure userId == currentuserId can't use
          ElevatedButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Add Job Experience'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration:
                              const InputDecoration(labelText: 'Job Title'),
                        ),
                        TextField(
                          controller: _durationController,
                          decoration:
                              const InputDecoration(labelText: 'Duration'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          _addJobExperience(context);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Add Experience'),
          )
      ],
    );
  }
}
