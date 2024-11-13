import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/utils.dart';
import '../blocs/coins/coins_bloc.dart';
import '../core/widgets/cuper_button.dart';
import '../core/widgets/custom_scaffold.dart';
import '../core/widgets/others/svg_widget.dart';

class SpinPage extends StatefulWidget {
  const SpinPage({super.key});

  @override
  State<SpinPage> createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> {
  double turns = 0.0;
  double angle = 0;
  String asset = '';
  bool canSpin = true;

  List<double> angles = [
    1, // 200
    2, // 100
    3, // 1000
    5, // 600
    6, // 2000
    7, // 500
    8, // 100
    9, // 1000
    10, // 2500
    12, // 2000
    13, // 500
    14, // 200
  ];

  int getCoins() {
    asset = '';
    if (angle == 1) return 200;
    if (angle == 2) return 100;
    if (angle == 3) return 1000;
    if (angle == 5) return 600;
    if (angle == 6) return 2000;
    if (angle == 7) return 500;
    if (angle == 8) return 100;
    if (angle == 9) return 1000;
    if (angle == 10) return 2500;
    if (angle == 12) return 2000;
    if (angle == 13) return 500;
    if (angle == 14) return 200;
    return 0;
  }

  void getRandom() {
    int randomIndex = Random().nextInt(angles.length);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          angle = angles[randomIndex];
          logger(angle);
        });
      },
    );
  }

  void onSpin() async {
    setState(() {
      turns += 5 / 1;
      canSpin = false;
    });
    getRandom();
    await Future.delayed(
      const Duration(seconds: 7),
      () async {
        coins += getCoins();
        lastSpin = getTimestamp();
        await saveInt('coins', coins);
        await saveInt('lastSpin', lastSpin);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            if (mounted) {
              context.read<CoinsBloc>().add(GetCoinsEvent());
              context.push('/home/spin/spinwin', extra: getCoins());
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: canSpin ? true : false,
      body: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 220,
            child: Stack(
              children: [
                Transform.rotate(
                  angle: angle,
                  child: AnimatedRotation(
                    duration: const Duration(seconds: 7),
                    turns: turns,
                    curve: Curves.easeInOutCirc,
                    child: const SvgWidget('assets/spinner2.svg'),
                  ),
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  top: 14,
                  child: SvgWidget('assets/spinner1.svg'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: canSpin
                ? Center(
                    child: CuperButton(
                      onPressed: onSpin,
                      child: const SvgWidget('assets/spin.svg'),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
