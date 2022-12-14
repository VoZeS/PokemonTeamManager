import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/text_stroke.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, 0.26),
            child: Transform.rotate(
              angle: -pi / 24,
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  color: const Color.fromARGB(255, 129, 238, 153),
                  width: screenWidth,
                  height: 130.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.75),
            child: Transform.rotate(
              angle: -pi / 24,
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  color: const Color.fromARGB(255, 255, 164, 164),
                  width: screenWidth,
                  height: 130.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.29),
            child: Transform.rotate(
              angle: pi / 24,
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  color: const Color.fromARGB(255, 164, 222, 255),
                  width: screenWidth,
                  height: 10.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.75),
            child: Transform.rotate(
              angle: pi / 24,
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  color: const Color.fromARGB(255, 164, 222, 255),
                  width: screenWidth,
                  height: 180.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.875),
            child: Transform.rotate(
              angle: pi / 24,
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  color: const Color.fromARGB(255, 164, 222, 255),
                  width: screenWidth,
                  height: 10.0,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  TextStroke(
                      text: "PÓKEMON",
                      strokeWidth: 6.0,
                      color: Colors.yellow,
                      colorStroke: Colors.blueAccent,
                      size: 64,
                      letSpacing: 16.0),
                  TextStroke(
                      text: "TEAM MANAGER",
                      strokeWidth: 3.0,
                      color: Colors.red,
                      colorStroke: Colors.white,
                      size: 24,
                      letSpacing: 20.0),
                ],
              ),
              Column(
                children: [
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
                  const SizedBox(height: 80.0),
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
              )
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 235, 163),
    );
  }
}
