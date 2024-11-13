import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/coins/coins_bloc.dart';
import '../core/utils.dart';
import 'cup_button.dart';
import 'custom_svg.dart';
import 'text_stroke.dart';

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
                    const CustomSvg('assets/coins.svg'),
                    Positioned(
                      top: 10,
                      left: 35,
                      child: BlocBuilder<CoinsBloc, CoinsState>(
                        builder: (context, state) {
                          if (state is CoinsLoadedState) {
                            return TextStroke(
                              state.coins.toString(),
                              strokeWidth: 3,
                              borderColor: const Color(0xff02B4FE),
                              fontSize: coins.toString().length >= 7 ? 14 : 18,
                            );
                          }

                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CoinsBloc, CoinsState>(
              builder: (context, state) {
                if (state is CoinsLoadedState && state.canSpin) {
                  return Positioned(
                    bottom: 20,
                    right: 63,
                    child: CupButton(
                      onPressed: () {
                        context.push('/home/spin');
                      },
                      child: const CustomSvg('assets/chest.svg'),
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
          if (back)
            Positioned(
              top: 20 + getTop(context),
              left: 45,
              child: CupButton(
                onPressed: () {
                  context.pop();
                },
                child: const CustomSvg('assets/back.svg'),
              ),
            ),
        ],
      ),
    );
  }
}
