import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final String? subtitle;
  final void Function()? onTap;

  const UserTile(
      {super.key, required this.text, required this.onTap, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 5), // Spacing between name and message preview
                ]))
          ],
        ),
      ),
    );
  }
}
