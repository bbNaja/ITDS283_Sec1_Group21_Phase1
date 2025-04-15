import 'package:flutter/material.dart';

import 'package:sec1_gr21/components/appbar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, String>> chatList = [
    {'name': 'Alice', 'message': 'Hey, how are you?'},
    {'name': 'Bob', 'message': 'Let\'s catch up later!'},
    {'name': 'Jason', 'message': 'See you tomorrow!'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBar(),
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
        }).toList()));
  }
}
