import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/model/pokemon.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/pokemon-details',
          arguments: pokemon,
        );
      },
      child: Container(
        height: 100,
        //width: screenWidth - screenWidth / 10,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("${pokemon.id}"),
          Text(pokemon.name),
          CircleAvatar(
            backgroundImage: pokemon.avatarUrl != null
                ? NetworkImage(pokemon.avatarUrl!)
                : null,
            backgroundColor: Colors.yellowAccent,
          ),
        ]),
      ),
    );
    // return ListTile(
    //   leading: CircleAvatar(
    //     backgroundImage:
    //         pokemon.avatarUrl != null ? NetworkImage(pokemon.avatarUrl!) : null,
    //     backgroundColor: Colors.yellowAccent,
    //   ),
    //   title: Text(pokemon.name),
    //   onTap: () {
    //     Navigator.of(context).pushNamed(
    //       '/pokemon-details',
    //       arguments: pokemon,
    //     );
    //   },
    // );
  }
}
