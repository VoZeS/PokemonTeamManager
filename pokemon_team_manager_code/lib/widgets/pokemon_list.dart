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
        .orderBy("pokedexNum", descending: false)
        .snapshots(),
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      ){
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
            final pNumb=(doc['pokedexNum']as String);
            final avatar=(doc['avatar']as String);
            return ListTile(
              leading: Text(pNumb.toString()),
              title: Text(doc['name']),
              subtitle: Text("Att: ${attack.toString()} Def: ${defense.toString()}"),
              trailing: CircleAvatar(
                backgroundImage: NetworkImage(avatar),
                maxRadius: 20,
                minRadius: 20,
                ),
              onTap: () {
                //Llògica per afegir al equip el pokemon
                
              },
            );
          },
        );
      },
    );
  }
}