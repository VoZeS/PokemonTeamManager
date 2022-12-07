import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return StreamBuilder(
          stream: db
              .collection("/teams")
              .orderBy("title", descending: false)
              .snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
          ) {
            // Step 1: Check for errors
            if (snapshot.hasError) {
              return ErrorWidget(snapshot.error.toString());
            }

            // Step 2: Check for data (!= nullptr)
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            // Step 3: Develop
            final querySnap = snapshot.data!;
            final docs = querySnap.docs;

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                final doc = docs[index];
                final date = (doc['createdAt'] as Timestamp).toDate();
                return ListTile(
                  title: Text(doc['title']),
                  trailing: Text(
                    ("Last Edit: ${date.toIso8601String()} ${doc.id}"),
                  ),
                  onTap: () {},
                );
              },
            );
          },
        );
  }
}