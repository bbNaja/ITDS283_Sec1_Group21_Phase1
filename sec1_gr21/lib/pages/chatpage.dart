import 'package:flutter/material.dart';

import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/util/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatService _chatService = ChatService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading ...");
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>((userData) => _buildUserListItem().toList()),
          );
        });
  }
}
