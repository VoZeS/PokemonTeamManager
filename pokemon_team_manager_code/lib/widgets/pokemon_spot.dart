import 'package:flutter/material.dart';

class PokemonSpot extends StatelessWidget {
  const PokemonSpot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 80,
        width: 60,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: IconButton(
          icon: const Icon(Icons.add_rounded),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/pokedex');
          },
        ),
      ),
    );
  }
}
