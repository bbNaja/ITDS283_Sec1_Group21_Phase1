import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sec1_gr21/components/chat/chatbubble.dart';
import 'package:sec1_gr21/util/chat/chat_service.dart';

class Msgpage extends StatelessWidget {
  final String recieverEmail;
  final String recieverID;
  Msgpage({super.key, required this.recieverEmail, required this.recieverID});

  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  //send msg
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(recieverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recieverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(recieverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser =
        data["senderID"] == FirebaseAuth.instance.currentUser!.uid;
    DateTime timestamp = (data["timestamp"] as Timestamp).toDate();
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Chatbubble(message: data["message"], isCurrentUser: isCurrentUser),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 10.0),
            child: Text(
                '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      child: Row(children: [
        Expanded(
            child: TextField(
          controller: _messageController,
          decoration: InputDecoration(
            hintText: "Type a message..",
          ),
        )),
        Container(
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            margin: const EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: sendMessage, icon: const Icon(Icons.arrow_upward)))
      ]),
    );
  }
}
