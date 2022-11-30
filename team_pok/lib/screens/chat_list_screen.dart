import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_firebase/widgets/chat_list.dart';

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
          db.collection("/chats").add({
            'title': 'New Chat',
            'createdAt': Timestamp.now(),
          });
        },
      ),
    );
  }
}
