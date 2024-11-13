import 'package:flutter/material.dart';

import '../core/widgets/others/rotated_widget.dart';
import '../core/widgets/others/svg_widget.dart';

class BalloonWidget extends StatelessWidget {
  const BalloonWidget({
    super.key,
    required this.scale,
  });

  final double scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 100),
      scale: scale,
      child: SizedBox(
        width: 230,
        height: 150,
        child: Stack(
          children: [
            const Positioned(
              top: 20,
              left: 0,
              child: SvgWidget('assets/balloon.svg'),
            ),
            Positioned(
              top: 0,
              right: 20,
              child: RotatedWidget(
                degree: 80,
                child: Image.asset(
                  'assets/images/balloon.png',
                  width: 126,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
