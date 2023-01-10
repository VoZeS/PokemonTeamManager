import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokemon_team_manager_code/model/pokemon.dart';
import 'package:pokemon_team_manager_code/widgets/pokemon_widget.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  List<Pokemon>? pokemonList;

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
    if (pokemonList == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Pokedex")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Pokedex")),
      body: ListView.separated(
        itemCount: pokemonList!.length,
        itemBuilder: (context, index) {
          return PokemonWidget(pokemon: pokemonList![index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            indent: 70,
            endIndent: 20,
          );
        },
      ),
    );
  }
}
