import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/utils.dart';
import '../core/widgets/cuper_button.dart';
import '../core/widgets/others/svg_widget.dart';
import '../core/widgets/texts/text_stroke.dart';

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
          const SvgWidget(
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
                    const SvgWidget('assets/coin.svg'),
                  ],
                ),
                const Spacer(),
                CuperButton(
                  onPressed: () {
                    context.pop();
                    context.pop();
                  },
                  child: const SvgWidget('assets/next.svg'),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          Positioned(
            top: 20 + getTop(context),
            left: 45,
            child: CuperButton(
              onPressed: () {
                context.pop();
                context.pop();
              },
              child: const SvgWidget('assets/back.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
