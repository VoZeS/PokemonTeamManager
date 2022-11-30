import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_firebase/widgets/message_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatId = ModalRoute.of(context)!.settings.arguments as String;
    final db = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [
          Expanded(child: _MessageList(chatId: chatId)),
          MessageBox(onSendMessage: (String message) {
            db.collection("chats/$chatId/messages").add({
              'text': message,
              'author': 'david',
              'date': Timestamp.now(),
            });
          }),
        ],
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({super.key, required this.chatId});
  final String chatId;

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return StreamBuilder(
      stream: db
      .collection("chats/$chatId/messages")
      .orderBy("date", descending: true)
      .limit(100)
      .snapshots(),

      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      ) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final querySnap = snapshot.data!;
        final docs = querySnap.docs;

        return ListView.builder(
          reverse: true,
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(4),
                  child: Text(doc['text']),
                ),
              ]),
            );
          },
        );
      },
    );
  }
}
