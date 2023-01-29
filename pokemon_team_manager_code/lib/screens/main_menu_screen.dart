// import 'dart:ffi';
import 'dart:math';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:pokemon_team_manager_code/main.dart';
import 'package:pokemon_team_manager_code/widgets/text_stroke.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final userid = context.read<String>();

    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                userid,
                style: const TextStyle(color: Colors.grey),
              )),
          Align(
            alignment: const Alignment(0.0, 0.35),
            child: Transform.rotate(
              angle: -pi / 24,
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  color: const Color.fromARGB(255, 129, 238, 153),
                  width: screenWidth,
                  height: screenHeight / 6,
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
                  height: screenHeight / 8,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, -0.275),
            child: Transform.rotate(
              angle: pi / 24,
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  color: const Color.fromARGB(255, 164, 222, 255),
                  width: screenWidth,
                  height: screenHeight / 80,
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
                  height: screenHeight / 4.15,
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
                  height: screenHeight / 80,
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
                      letSpacing: 18.0),
                  SizedBox(height: 10.0),
                  TextStroke(
                      text: "1ST GENERATION",
                      strokeWidth: 2.0,
                      color: Colors.deepOrange,
                      colorStroke: Colors.white,
                      size: 14,
                      letSpacing: 10.0),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 236, 52),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white, width: 3.0),
                    ),
                    child: TextButton(
                      onPressed: (() {
                        Navigator.of(context).pushReplacementNamed(
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
                  SizedBox(height: screenHeight / 8),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 251, 46, 46),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white, width: 3.0),
                    ),
                    child: TextButton(
                      onPressed: (() {
                        Navigator.of(context).pushReplacementNamed(
                          '/pokedex',
                        );
                      }),
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
