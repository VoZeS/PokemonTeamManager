import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/pokemon_spot.dart';

class TeamContainer extends StatelessWidget {
  const TeamContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Container(
          height: 180,
          //width: screenWidht - screenWidht / 10,
          decoration: const BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.all(Radius.circular(80))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Team 1",
                  style: TextStyle(
                      fontFamily: "Orbitron",
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  PokemonSpot(),
                  PokemonSpot(),
                  PokemonSpot(),
                  PokemonSpot(),
                  PokemonSpot(),
                  PokemonSpot(),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Icon(Icons.arrow_downward),
              ),
            ],
          )),
    );
  }
}
