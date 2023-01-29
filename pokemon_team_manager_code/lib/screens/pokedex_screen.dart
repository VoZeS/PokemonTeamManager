import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokemon_team_manager_code/model/pokemon.dart';
import 'package:pokemon_team_manager_code/widgets/pokemon_widget.dart';

import '../widgets/pokemon_list.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  List<Pokemon>? pokemonList;
  //Pokemon? pokemonDetail;
  String selected = "";

  @override
  void initState() {
    loadPokemonList().then((loadedPokemonList) {
      setState(() {
        pokemonList = loadedPokemonList;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //final selected = ModalRoute.of(context)!.settings.arguments as String;

    if (pokemonList == null) {
      return const Scaffold(
        // appBar: AppBar(
        //     title: const Text("Pokedex"),
        //     leading: IconButton(
        //       onPressed: (() {
        //         Navigator.of(context).pushReplacementNamed('/');
        //       }),
        //       icon: const Icon(Icons.arrow_back),
        //     )),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 164, 164),
      body: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "POKÉDEX",
                  style: TextStyle(
                      fontSize: 54,
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
                        '/',
                      );
                    }),
                    icon: const Icon(Icons.home, color: Colors.black),
                  ),
                  Container(
                    width: screenWidth - 100,
                    height: 10,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 238, 238, 238)),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 150.0),
            child: const PokemonList(),
          )
        ],
      ),
    );
  }
}
