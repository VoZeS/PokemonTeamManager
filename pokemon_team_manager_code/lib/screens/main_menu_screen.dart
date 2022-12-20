// import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_team_manager_code/widgets/text_stroke.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0.0, 0.31),
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
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Text(
                "Welcome, ${user.email}!",
                style: const TextStyle(
                    fontFamily: "Orbitron",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.black,
                    letterSpacing: 2.0),
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
