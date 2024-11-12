import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.title, {
    super.key,
    required this.fontSize,
    this.color = Colors.white,
    this.textAlign,
    this.maxLines,
  });

  final String title;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'SF',
      ),
    );
  }
}
