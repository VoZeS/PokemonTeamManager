import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/main.dart';
import 'package:pokemon_team_manager_code/widgets/team_container.dart';
import 'package:provider/provider.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    //final teamId = ModalRoute.of(context)!.settings.arguments as String;
    final db = FirebaseFirestore.instance;
        final userid = context.read<String>();


    return StreamBuilder(
      stream: db
          .collection("/users/$userid/teams")
          .orderBy('hintTitle')
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

        if (docs.isEmpty) {
          createTeam(userid, 1, 255, 230, 0);
          createTeam(userid, 2, 255, 92, 0);
          createTeam(userid, 3, 255, 0, 219);
        }

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
                          .collection("/users/$userid/teams")
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
