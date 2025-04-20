import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sec1_gr21/components/appbar.dart';
import 'package:sec1_gr21/components/chat/user_tile.dart';
import 'package:sec1_gr21/pages/chatpage/msgpage.dart';
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
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Colors.transparent,
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    //List User
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
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      //build individual list tile for use
      Map<String, dynamic> userData,
      BuildContext context) {
    String userName = userData["name"]?.isNotEmpty == true
        ? userData["name"]
        : userData["email"] ?? "Guest";

    // Default to "Unknown" if null
    String userId = userData["uid"] ?? ""; // Default to empty string if null
    if (userName.isEmpty ||
        userName == "Guest" ||
        userName == FirebaseAuth.instance.currentUser?.email) {
      return const SizedBox(); // Return an empty widget to not display it
    }

    if (userName != FirebaseAuth.instance.currentUser?.email ||
        userName != "Guest") {
      return UserTile(
        text: userName,
        onTap: () {
          if (userId.isNotEmpty) {
            // Make sure the userId is not empty before navigating
            Navigator.push(
              //push into msg page individual profile
              context,
              MaterialPageRoute(
                builder: (context) => Msgpage(
                  recieverEmail: userName,
                  recieverID: userId,
                ),
              ),
            );
          }
        },
      );
    } else {
      return const SizedBox(); // Empty widget if current user
    }
  }
}
