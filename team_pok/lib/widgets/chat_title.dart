import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatTitle extends StatelessWidget {
  const ChatTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return StreamBuilder(
          stream: db.doc("/chats/zrkppBdEIEIfZ7GOVS47").snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
          ) {
            // 1. Look for errors
            if (snapshot.hasError) {
              return ErrorWidget(snapshot.error.toString());
            }

            // 2. If we do not have data
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            // 3. Extract data from AsyncSnapShot
            final docSnap = snapshot.data!;
            return Text(
              docSnap['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.w900),
            );
          },
        );
  }
}