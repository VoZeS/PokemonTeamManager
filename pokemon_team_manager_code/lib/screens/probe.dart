import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemon_team_manager_code/widgets/probechat.dart';


class ChatListScreen extends StatelessWidget {
  const ChatListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final db = FirebaseFirestore.instance;
     
    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: const ChatList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // db.collection("/teams").add({
          //   'title': 'New Chat',
          //   'createdAt': Timestamp.now(),
         // });
        },
      ),
    );
  }
}