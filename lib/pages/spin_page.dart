import 'package:flutter/material.dart';

import '../core/widgets/cuper_button.dart';
import '../core/widgets/custom_scaffold.dart';
import '../core/widgets/others/svg_widget.dart';

class SpinPage extends StatefulWidget {
  const SpinPage({super.key});

  @override
  State<SpinPage> createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: true,
      body: Column(
        children: [
          const Spacer(),
          CuperButton(
            onPressed: () {},
            child: const SvgWidget('assets/spin.svg'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
