import 'package:flutter/material.dart';

class HPStadistics extends StatelessWidget {
  final int totalHp;
  final int avgHP;

  const HPStadistics({
    Key? key,
    required this.totalHp,
    required this.avgHP,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "T. HP: $totalHp",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
        Text(
          "Avg. HP: $avgHP",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}

class DefStadistics extends StatelessWidget {
  final int totalDef;
  final int avgDef;

  const DefStadistics({
    Key? key,
    required this.totalDef,
    required this.avgDef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "T. Def: $totalDef",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
        Text(
          "Avg. Def: $avgDef",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}

class AttStadistics extends StatelessWidget {
  final int totalAtt;
  final int avgAtt;

  const AttStadistics({
    Key? key,
    required this.totalAtt,
    required this.avgAtt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "T. Att: $totalAtt",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
        Text(
          "Avg. Att: $avgAtt",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}

class SpecialDefStadistics extends StatelessWidget {
  final int totalSDef;
  final int avgSDef;

  const SpecialDefStadistics({
    Key? key,
    required this.totalSDef,
    required this.avgSDef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "T. S.Def: $totalSDef",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
        Text(
          "Avg. S.Def: $avgSDef",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}

class SpecialAttStadistics extends StatelessWidget {
  final int totalSAtt;
  final int avgSAtt;

  const SpecialAttStadistics({
    Key? key,
    required this.totalSAtt,
    required this.avgSAtt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "T. S.Att: $totalSAtt",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
        Text(
          "Avg. S.Att: $avgSAtt",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}

class SpeedStadistics extends StatelessWidget {
  final int totalSpd;
  final int avgSpd;

  const SpeedStadistics({
    Key? key,
    required this.totalSpd,
    required this.avgSpd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "T. Spd: $totalSpd",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
        Text(
          "Avg. Spd: $avgSpd",
          style: const TextStyle(
              fontSize: 24,
              fontFamily: "Orbitron",
              fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}
