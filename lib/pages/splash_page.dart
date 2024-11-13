import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/coins/coins_bloc.dart';
import '../core/utils.dart';
import '../core/widgets/others/rotated_widget.dart';
import '../core/widgets/others/svg_widget.dart';
import '../core/widgets/texts/text_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _widthAnimation;

  void load() async {
    await getData().then((value) {
      Future.delayed(const Duration(milliseconds: 2400), () {
        if (mounted) {
          context.read<CoinsBloc>().add(GetCoinsEvent());
          context.go('/home');
        }
        // logger('GOING TO HOME');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _widthAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.1, curve: Curves.easeOut),
      ),
    );
    _controller.forward();
    load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (_animation.value * 100).round();
    final animatedWidth = _widthAnimation.value * 432;

    return Scaffold(
      backgroundColor: const Color(0xff02B4FE),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 2,
            child: Image.asset(
              'assets/images/cloud.png',
              height: 170,
            ),
          ),
          Positioned(
            top: 35,
            right: 0,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                'assets/images/cloud.png',
                height: 170,
              ),
            ),
          ),
          Positioned(
            top: 156,
            left: 170,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                'assets/images/cloud.png',
                height: 74,
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 320,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                'assets/images/cloud.png',
                height: 74,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: -107,
            child: Image.asset(
              'assets/images/cloud.png',
              height: 170,
            ),
          ),
          Positioned(
            left: -58,
            bottom: -38,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                'assets/images/cloud.png',
                height: 170,
              ),
            ),
          ),
          const Positioned(
            top: 77,
            left: 54,
            child: _Balloon(
              id: 2,
              scale: 0.7,
              degree: -5,
            ),
          ),
          const Positioned(
            top: 35,
            left: 242,
            child: _Balloon(
              id: 3,
              scale: 0.3,
              degree: -5,
            ),
          ),
          const Positioned(
            top: 76,
            right: 256,
            child: _Balloon(
              id: 4,
              scale: 0.5,
              degree: -5,
            ),
          ),
          const Positioned(
            top: 64,
            right: 34,
            child: _Balloon(
              id: 5,
              scale: 0.5,
              degree: 6,
            ),
          ),
          const Positioned(
            bottom: -90,
            right: 62,
            child: _Balloon(
              id: 3,
              scale: 0.5,
              degree: -6,
            ),
          ),
          Center(
            child: Column(
              children: [
                const Spacer(flex: 2),
                const TextWidget('Loading...', fontSize: 32),
                const SizedBox(height: 2),
                Container(
                  height: 44,
                  width: 440,
                  decoration: BoxDecoration(
                    color: const Color(0xffEADBE6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 41,
                        width: 440,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Container(
                            height: 37,
                            width: 436,
                            decoration: BoxDecoration(
                              color: const Color(0xff1D7999),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Container(
                                height: 33,
                                width: 432,
                                decoration: BoxDecoration(
                                  color: const Color(0xff006C9B),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(13),
                                        child: AnimatedContainer(
                                          duration: const Duration(seconds: 2),
                                          height: 33,
                                          width: animatedWidth,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff25A7DF),
                                            borderRadius:
                                                BorderRadius.circular(13),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: TextWidget(
                                        '$percentage%',
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Balloon extends StatelessWidget {
  const _Balloon({
    required this.id,
    required this.scale,
    required this.degree,
  });

  final int id;
  final double scale;
  final int degree;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: SizedBox(
        height: 205,
        width: 132,
        child: Stack(
          children: [
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: RotatedWidget(
                degree: -80,
                child: SvgWidget('assets/balloon.svg'),
              ),
            ),
            RotatedWidget(
              degree: degree,
              child: Image.asset('assets/images/balloon$id.png'),
            ),
          ],
        ),
      ),
    );
  }
}
