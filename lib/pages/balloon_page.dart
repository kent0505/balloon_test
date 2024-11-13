import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/utils.dart';
import '../core/widgets/custom_scaffold.dart';
import '../core/widgets/others/svg_widget.dart';
import '../widgets/balloon_widget.dart';

class BalloonPage extends StatefulWidget {
  const BalloonPage({
    super.key,
    required this.level,
  });

  final int level;

  @override
  State<BalloonPage> createState() => _BalloonPageState();
}

class _BalloonPageState extends State<BalloonPage> {
  final controller = FixedExtentScrollController();
  int currentIndex = 0;
  int winAmount = 0;
  double scale = 0.1;
  Timer? timer;
  bool loose = false;
  final List<double> coefList = List.generate(21, (index) => (index + 1) * 0.5);

  int getAmount() {
    return ((scale * winAmount) * coefList[currentIndex]).round();
  }

  void restart() {
    logger('RESTART');
    currentIndex = 0;
    scale = 0.1;
    loose = false;
    controller.jumpTo(0);
    setState(() {});
  }

  double generateRandomValue() {
    return 0.5 + Random().nextDouble() * 2.0;
  }

  void onPressStart() {
    logger('START');
    double randomDouble = generateRandomValue();
    logger('randomDouble = ${randomDouble.toStringAsFixed(2)}');

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) async {
      if (scale < 2.5) {
        if (scale < randomDouble) {
          setState(() {
            scale = (scale + 0.1).clamp(0.1, 2.5);
          });
        } else {
          handleLoose();
        }
      }
    });
  }

  void handleLoose() async {
    logger('LOOSE');
    loose = true;
    timer?.cancel();
    int loss = getAmount();
    logger('Loss: $loss');
    coins -= loss;
    await saveInt('coins', coins);
    if (mounted) {
      context.push('/home/level/balloon/win', extra: 0).then((_) {
        restart();
      });
    }
  }

  void onPressEnd() async {
    if (loose) return;
    logger('WIN');
    timer?.cancel();
    int win = getAmount();
    logger('Win: $win');
    coins += win;
    await saveInt('coins', coins);
    if (mounted) {
      context.push('/home/level/balloon/win', extra: win).then((_) {
        restart();
      });
    }
  }

  void onScroll() {
    final newIndex = controller.selectedItem;
    if (currentIndex != newIndex) {
      setState(() {
        currentIndex = newIndex;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
    if (widget.level == 1) winAmount = 50;
    if (widget.level == 2) winAmount = 100;
    if (widget.level == 3) winAmount = 200;
  }

  @override
  void dispose() {
    controller.removeListener(onScroll);
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      back: true,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: ListWheelScrollView.useDelegate(
                      controller: controller,
                      itemExtent: 100,
                      perspective: 0.002,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: coefList.length,
                        builder: (context, index) {
                          final bool isSelected = index == currentIndex;
                          final bool isPrevious1 = index == currentIndex - 1;
                          final bool isPrevious2 = index == currentIndex + 1;
                          final double fontSize = isSelected ? 34 : 20;
                          final Color color = isSelected
                              ? Colors.white
                              : isPrevious1 || isPrevious2
                                  ? Colors.white.withOpacity(0.75)
                                  : Colors.white.withOpacity(0.5);

                          return RotatedBox(
                            quarterTurns: 1,
                            child: SizedBox(
                              width: 100,
                              child: Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    color: color,
                                    fontFamily: 'SF',
                                  ),
                                  child: Text('X${coefList[index]}'),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 56,
            child: GestureDetector(
              onTapDown: (_) => onPressStart(),
              onTapUp: (_) => onPressEnd(),
              onTapCancel: () => onPressEnd(),
              child: const SvgWidget('assets/stop.svg'),
            ),
          ),
          Center(
            child: BalloonWidget(scale: scale),
          ),
        ],
      ),
    );
  }
}
