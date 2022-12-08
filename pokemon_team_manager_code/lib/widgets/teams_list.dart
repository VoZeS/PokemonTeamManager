import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/team_container.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    //final teamId = ModalRoute.of(context)!.settings.arguments as String;
    final db = FirebaseFirestore.instance;

    return StreamBuilder(
      stream: db.collection("/teams").orderBy("createdAt").snapshots(),
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

        return Expanded(
          child: ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: TeamContainer(
                    name: doc['teamName'],
                    hintName: doc['hintTitle'],
                    nameUpdate: (String teamName) {
                      db
                          .collection("teams")
                          .doc(doc.id)
                          .update({"teamName": teamName});
                    },
                    r: doc['r'],
                    g: doc['g'],
                    b: doc['b']),
              );
            },
          ),
        );
      },
    );
  }
}
