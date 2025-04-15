import 'package:flutter/material.dart';

class Forchatpage extends StatefulWidget {
  const Forchatpage({
    Key? key,
  }) : super(key: key);

  @override
  State<Forchatpage> createState() => _Forchatpagestate();
}

class _Forchatpagestate extends State<Forchatpage> {
  final List<Map<String, String>> chatList = [
    {'name': 'Alice', 'message': 'Hey, how are you?'},
    {'name': 'Bob', 'message': 'Let\'s catch up later!'},
    {'name': 'Jason', 'message': 'See you tomorrow!'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: chatList.map((chat) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(chat['name']![0]),
            ),
            title: Text(chat['name']!),
            subtitle: Text(chat['message']!),
            onTap: () {},
          );
        }).toList(),
      ),
    );
  }
}
