import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/utils.dart';
import '../widgets/cup_button.dart';
import '../widgets/rotated_widget.dart';
import '../widgets/custom_svg.dart';
import '../widgets/text_stroke.dart';
import '../widgets/balloon_widget.dart';

class WinPage extends StatelessWidget {
  const WinPage({
    super.key,
    required this.amount,
  });

  final int amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          amount != 0 ? const Color(0xff02B4FE) : const Color(0xff5B000F),
      body: Stack(
        children: [
          CustomSvg(
            amount != 0 ? 'assets/win2.svg' : 'assets/win3.svg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          if (amount != 0)
            Image.asset(
              'assets/images/win.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          Positioned(
            top: 60,
            left: getWidth(context) / 2 - 130,
            child: const RotatedWidget(
              degree: -70,
              child: BalloonWidget(scale: 1),
            ),
          ),
          Center(
            child: Column(
              children: [
                const Spacer(flex: 2),
                TextStroke(
                  amount != 0 ? 'GREAT' : 'YOU LOSE',
                  fontSize: 63,
                  borderColor: amount != 0
                      ? const Color(0xff1D7999)
                      : const Color(0xff991D1D),
                ),
                const SizedBox(height: 30),
                TextStroke(
                  amount != 0
                      ? 'You have successfully\ninflated the balloon !'
                      : 'Next time you\'ll be lucky !',
                  fontSize: 24,
                  borderColor: amount != 0
                      ? const Color(0xff1D7999)
                      : const Color(0xff991D1D),
                ),
                if (amount != 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextStroke(
                        amount.toString(),
                        fontSize: 72,
                        strokeWidth: 8,
                        borderColor: const Color(0xff02B4FE),
                      ),
                      const SizedBox(width: 30),
                      const CustomSvg('assets/coin.svg'),
                    ],
                  ),
                const SizedBox(height: 30),
                CupButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const CustomSvg('assets/restart.svg'),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          Positioned(
            top: 20 + getTop(context),
            left: 45,
            child: CupButton(
              onPressed: () {
                context.pop();
              },
              child: const CustomSvg('assets/back.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
