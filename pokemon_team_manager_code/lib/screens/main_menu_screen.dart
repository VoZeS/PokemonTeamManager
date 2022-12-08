import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/text_stroke.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const TextStroke(
              text: "Pókemon",
              strokeWidth: 6.0,
              color: Colors.yellow,
              colorStroke: Colors.blue,
              size: 64),
          Container(
            width: 300,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 236, 52),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.white, width: 3.0),
            ),
            child: TextButton(
              onPressed: (() {
                Navigator.of(context).pushNamed(
                  '/teams',
                );
              }),
              child: const Text(
                "Teams",
                style: TextStyle(
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Colors.white,
                    letterSpacing: 4.0),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 251, 46, 46),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.white, width: 3.0),
            ),
            child: TextButton(
              onPressed: (() {}),
              child: const Text(
                "Pokédex",
                style: TextStyle(
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Colors.white,
                    letterSpacing: 4.0),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 235, 163),
    );
  }
}
