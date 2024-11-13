import 'package:flutter/material.dart';

import '../widgets/custom_scaffold.dart';
import '../widgets/custom_text.dart';

class HowtoPage extends StatelessWidget {
  const HowtoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: true,
      body: Center(
        child: Container(
          height: 268,
          width: 475,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Container(
            height: 258,
            width: 455,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xff25A7DF),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Column(
              children: [
                Spacer(),
                CustomText(
                  'How to play',
                  fontSize: 24,
                ),
                Spacer(),
                CustomText(
                  'The essence of the game is that you have to press a button and the balloon increases in size ‘inflates’ up to a certain x-coefficient, we have to manage to release it.',
                  fontSize: 20,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
