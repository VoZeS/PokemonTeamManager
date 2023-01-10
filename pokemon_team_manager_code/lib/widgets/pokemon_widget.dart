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
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            pokemon.avatarUrl != null ? NetworkImage(pokemon.avatarUrl!) : null,
        backgroundColor: Colors.yellowAccent,
      ),
      title: Text(pokemon.name),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/pokemon-details',
          arguments: pokemon,
        );
      },
    );
  }
}
