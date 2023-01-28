import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokemon_team_manager_code/model/pokemon.dart';
import 'package:pokemon_team_manager_code/widgets/stadistics.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonId = ModalRoute.of(context)!.settings.arguments as String;
    final db = FirebaseFirestore.instance;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return StreamBuilder(
      stream: db.doc("/Pokemons/$pokemonId").snapshots(),
      builder: (
        BuildContext context,
        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
      ) {
        // 1. Mirar si hi ha hagut errors
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        // 2. Si encara no tenim dades
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        // Extreure dades del AsyncSnapshot
        final docSnap = snapshot.data!;
        return Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: const Alignment(0.0, -0.525),
                child: Transform.rotate(
                  angle: pi / 32,
                  child: Transform.scale(
                    scale: 1.1,
                    child: Container(
                      color: const Color.fromARGB(255, 129, 238, 153),
                      width: screenWidth,
                      height: screenHeight / 3.5,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.0, 0.525),
                child: Transform.rotate(
                  angle: -pi / 32,
                  child: Transform.scale(
                    scale: 1.1,
                    child: Container(
                      color: const Color.fromARGB(255, 255, 164, 164),
                      width: screenWidth,
                      height: screenHeight / 4,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "POKEMON SELECTED",
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.w900),
                    ), // Title
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: (() {
                          Navigator.of(context).pushNamed(
                            '/pokedex',
                          );
                        }),
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      Container(
                        width: screenWidth - 100,
                        height: 10,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 238, 238, 238)),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight / 20),
                  CircleAvatar(
                    backgroundImage: docSnap['avatar'] != null
                        ? NetworkImage(docSnap['avatar']!)
                        : null,
                    backgroundColor: Colors.yellowAccent,
                    radius: 100.0,
                  ),
                  SizedBox(height: screenHeight / 40),
                  Center(
                    child: Text(
                      docSnap['name'],
                      style: const TextStyle(
                          fontSize: 30,
                          fontFamily: "Orbitron",
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Text(
                    "Water",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Orbitron",
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: screenHeight / 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SizedBox(height: 8),
                      Text(
                        "T. HP: 20",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Orbitron",
                            fontWeight: FontWeight.w100),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "T. Def: 10",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Orbitron",
                            fontWeight: FontWeight.w100),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "T. Att: 55",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Orbitron",
                            fontWeight: FontWeight.w100),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "T. S.Def: 60",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Orbitron",
                            fontWeight: FontWeight.w100),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "T. S.Att: 72",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Orbitron",
                            fontWeight: FontWeight.w100),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "T. Spd: 12",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Orbitron",
                            fontWeight: FontWeight.w100),
                      ),
                    ],
                  )
                ]),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 255, 235, 163),
        );
      },
    );
  }
}
