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
  //Pokemon? pokemonDetail;

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
        appBar: AppBar(
            title: const Text("Pokedex"),
            leading: IconButton(
              onPressed: (() {
                Navigator.of(context).pushReplacementNamed('/');
              }),
              icon: const Icon(Icons.arrow_back),
            )),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text("Pokedex"),
          leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            icon: const Icon(Icons.arrow_back),
          )),
      body: ListView.builder(
        itemCount: pokemonList!.length,
        itemBuilder: (context, index) {
          // loadPokemon(pokemonList![index].id).then(
          //   (loadedPokemonDetail) {
          //     setState(() {
          //       pokemonDetail = loadedPokemonDetail;
          //     });
          //   },
          // );

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PokemonWidget(pokemon: pokemonList![index]),
          );
        },
      ),
    );
  }
}
