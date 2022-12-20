import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/teams_list.dart';

class TeamsListScreen extends StatelessWidget {
  const TeamsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 129, 238, 153), //Background Green
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "YOUR TEAMS",
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
              const TeamsList()
            ]));
  }
}
