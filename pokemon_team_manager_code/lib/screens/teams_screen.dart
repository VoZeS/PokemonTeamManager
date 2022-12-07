import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/team_container.dart';

class TeamsListScreen extends StatelessWidget {
  const TeamsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidht = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 129, 238, 153), //Background Green
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("YOUR TEAMS",
                style: TextStyle(
                    fontSize: 54,
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900)), // Title
          ),
          Container(
            width: screenWidht,
            height: 10,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 238, 238, 238)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: const [
                TeamContainer(),
                TeamContainer(),
                TeamContainer(),
              ],
            ),
          )
        ]));
  }
}
