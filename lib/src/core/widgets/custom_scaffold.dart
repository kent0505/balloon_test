import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils.dart';
import 'buttons/cuper_button.dart';
import 'others/svg_widget.dart';
import 'texts/text_stroke.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.back = false,
    this.home = false,
  });

  final Widget body;
  final bool back;
  final bool home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            top: 130,
            left: 265,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                'assets/images/cloud.png',
                height: 74,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 273,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                'assets/images/cloud.png',
                height: 74,
              ),
            ),
          ),
          Center(child: body),
          if (home) ...[
            Positioned(
              top: 20 + getTop(context),
              right: 55,
              child: SizedBox(
                height: 40,
                width: 132,
                child: Stack(
                  children: [
                    const SvgWidget('assets/coins.svg'),
                    Positioned(
                      top: 10,
                      left: 35,
                      child: TextStroke(
                        coins.toString(),
                        strokeWidth: 3,
                        borderColor: const Color(0xff02B4FE),
                        fontSize: coins.toString().length >= 7 ? 14 : 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 63,
              child: CuperButton(
                onPressed: () {
                  context.push('/home/spin');
                },
                child: const SvgWidget('assets/chest.svg'),
              ),
            ),
          ],
          if (back)
            Positioned(
              top: 20 + getTop(context),
              left: 45,
              child: CuperButton(
                onPressed: () {
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
