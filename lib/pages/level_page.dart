import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/cup_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_svg.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: true,
      body: Column(
        children: [
          const Spacer(),
          CupButton(
            onPressed: () {
              context.push('/home/level/balloon', extra: 1);
            },
            child: const CustomSvg('assets/easy.svg'),
          ),
          const SizedBox(height: 18),
          CupButton(
            onPressed: () {
              context.push('/home/level/balloon', extra: 2);
            },
            child: const CustomSvg('assets/normal.svg'),
          ),
          const SizedBox(height: 18),
          CupButton(
            onPressed: () {
              context.push('/home/level/balloon', extra: 3);
            },
            child: const CustomSvg('assets/hard.svg'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
