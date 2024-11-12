import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/others/svg_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      home: true,
      body: Column(
        children: [
          const Spacer(),
          CuperButton(
            onPressed: () {
              context.push('/home/level');
            },
            child: const SvgWidget('assets/play.svg'),
          ),
          const SizedBox(height: 18),
          CuperButton(
            onPressed: () {
              context.push('/home/howto');
            },
            child: const SvgWidget('assets/howto.svg'),
          ),
          const SizedBox(height: 18),
          CuperButton(
            onPressed: () {
              context.push('/home/settings');
            },
            child: const SvgWidget('assets/settings.svg'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
