import 'package:flutter/material.dart';

class RotatedWidget extends StatelessWidget {
  const RotatedWidget({
    super.key,
    required this.child,
    required this.degree,
  });

  final Widget child;
  final int degree;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(degree / 360),
      child: child,
    );
  }
}
