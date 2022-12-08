import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/pokemon_spot.dart';

class TeamContainer extends StatefulWidget {
  final String name;
  final String hintName;
  final int r;
  final int g;
  final int b;

  const TeamContainer({
    Key? key,
    required this.name,
    required this.nameUpdate,
    required this.r,
    required this.g,
    required this.b,
    required this.hintName,

  }) : super(key: key);
  final void Function(String teamName) nameUpdate;

  @override
  State<TeamContainer> createState() => _TeamContainerState();
}

class _TeamContainerState extends State<TeamContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        //width: screenWidht - screenWidht / 10,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, widget.r, widget.g, widget.b),
          borderRadius: const BorderRadius.all(Radius.circular(60)),
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.name,
                maxLength: 20,
                decoration: InputDecoration(
                  counterText: "",
                  constraints:
                      const BoxConstraints.expand(width: 300.0, height: 40.0),
                  hintText: widget.hintName,
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
                onChanged: (newName) {
                  if (newName.isNotEmpty) {
                    widget.nameUpdate(newName);
                  } else {
                    newName = widget.hintName;
                    widget.nameUpdate(newName);
                  }
                },
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
        ));
  }
}
