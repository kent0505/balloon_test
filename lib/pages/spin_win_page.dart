import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/utils.dart';
import '../widgets/cup_button.dart';
import '../widgets/custom_svg.dart';
import '../widgets/text_stroke.dart';

class SpinWinPage extends StatelessWidget {
  const SpinWinPage({
    super.key,
    required this.amount,
  });

  final int amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff02B4FE),
      body: Stack(
        children: [
          const CustomSvg(
            'assets/win2.svg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/win.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              children: [
                const Spacer(flex: 2),
                const TextStroke(
                  'GREAT',
                  fontSize: 63,
                ),
                const TextStroke(
                  'YOU WIN',
                  fontSize: 24,
                ),
                const Spacer(),
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
                const Spacer(),
                CupButton(
                  onPressed: () {
                    context.pop();
                    context.pop();
                  },
                  child: const CustomSvg('assets/next.svg'),
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
