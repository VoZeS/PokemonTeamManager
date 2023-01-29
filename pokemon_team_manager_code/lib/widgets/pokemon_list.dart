import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_ui/auth.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return StreamBuilder(
      stream: db
          .collection("/Pokemons")
          .orderBy("type", descending: true)
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
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            final attack = (doc['attack'] as String);
            final defense = (doc['defense'] as String);
            //final pNumb = (doc['pokedexNum'] as String);
            final avatar = (doc['avatar'] as String);
            final type = (doc['type'] as String);

            return ListTile(
              tileColor: type == "Plant"
                  ? Colors.green[300]
                  : type == "Water"
                      ? Colors.blue[200]
                      : type == "Normal"
                          ? Colors.brown[200]
                          : type == "Fire"
                              ? Colors.red[400]
                              : type == "Bug"
                                  ? Colors.purple[200]
                                  : Colors.grey[300],
              //leading: Text(pNumb.toString()),
              title: Text(doc['name']),
              subtitle:
                  Text("Att: ${attack.toString()} Def: ${defense.toString()}"),
              trailing: CircleAvatar(
                backgroundColor: Colors.indigo[50],
                backgroundImage: NetworkImage(avatar),
                maxRadius: 25,
                minRadius: 25,
              ),
              onTap: () {
                // Navigator.of(context).pushNamed(
                //   '/pokemon-details',
                // );
              },
            );
          },
        );
      },
    );
  }
}
