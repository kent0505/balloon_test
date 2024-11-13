import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/widgets/cuper_button.dart';
import '../core/widgets/custom_scaffold.dart';
import '../core/widgets/others/svg_widget.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: true,
      body: Column(
        children: [
          const Spacer(),
          CuperButton(
            onPressed: () {
              context.push('/home/level/balloon', extra: 1);
            },
            child: const SvgWidget('assets/easy.svg'),
          ),
          const SizedBox(height: 18),
          CuperButton(
            onPressed: () {
              context.push('/home/level/balloon', extra: 2);
            },
            child: const SvgWidget('assets/normal.svg'),
          ),
          const SizedBox(height: 18),
          CuperButton(
            onPressed: () {
              context.push('/home/level/balloon', extra: 3);
            },
            child: const SvgWidget('assets/hard.svg'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
