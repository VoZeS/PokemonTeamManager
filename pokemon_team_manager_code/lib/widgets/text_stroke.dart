import 'package:flutter/material.dart';

class TextStroke extends StatelessWidget {
  final String text;
  final double strokeWidth;
  final double size;
  final Color color;
  final Color colorStroke;

  const TextStroke({
    Key? key,
    required this.strokeWidth,
    required this.text,
    required this.size,
    required this.color,
    required this.colorStroke,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
          child: Text(
        text,
        style: TextStyle(
            fontFamily: "Orbitron",
            fontWeight: FontWeight.w900,
            fontSize: size,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = Colors.blue),
      )),
      Center(
          child: Text(
        text,
        style: TextStyle(
            fontFamily: "Orbitron",
            fontWeight: FontWeight.w900,
            fontSize: size,
            color: color),
      )),
    ]);
  }
}
