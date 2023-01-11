import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/pokemon_spot.dart';
import 'package:pokemon_team_manager_code/widgets/stadistics.dart';

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
  bool extraInfo = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        height: extraInfo ? 200 * 2.5 : 200,
        //width: screenWidht - screenWidht / 10,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, widget.r, widget.g, widget.b),
          borderRadius: const BorderRadius.all(Radius.circular(60)),
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            if (extraInfo) ...[
              const SizedBox(height: 8),
              Container(
                width: screenWidth - 100,
                height: 8,
                decoration: const BoxDecoration(color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text(
                "TEAM STATS",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(height: 8),
                  HPStadistics(totalHp: 200, avgHP: 67),
                  SizedBox(height: 8),
                  DefStadistics(totalDef: 100, avgDef: 26),
                  SizedBox(height: 8),
                  AttStadistics(totalAtt: 204, avgAtt: 45),
                  SizedBox(height: 8),
                  SpeedStadistics(totalSpd: 700, avgSpd: 486),
                  SizedBox(height: 8),
                  SpecialDefStadistics(totalSDef: 500, avgSDef: 369),
                  SizedBox(height: 8),
                  SpecialAttStadistics(totalSAtt: 60, avgSAtt: 27),
                  SizedBox(height: 8)
                ],
              )
            ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: IconButton(
                onPressed: (() {
                  setState(() {
                    extraInfo = !extraInfo;
                  });
                }),
                icon: Icon(
                    extraInfo ? Icons.arrow_upward : Icons.arrow_downward,
                    color: Colors.black),
              ),
            ),
          ],
        ));
  }
}
