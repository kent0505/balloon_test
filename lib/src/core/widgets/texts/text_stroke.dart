import 'package:flutter/material.dart';

class TextStroke extends StatelessWidget {
  const TextStroke(
    this.title, {
    super.key,
    this.fontSize = 20,
    this.strokeWidth = 6,
    this.fontFamily = 'SF',
    this.borderColor = const Color(0xff1D7999),
    this.textColor = Colors.white,
  });

  final String title;
  final double fontSize;
  final double strokeWidth;
  final String fontFamily;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = borderColor,
          ),
        ),
        // Solid text as fill.
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
