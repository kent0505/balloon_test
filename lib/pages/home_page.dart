import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/coins/coins_bloc.dart';
import '../widgets/cup_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      home: true,
      body: Column(
        children: [
          const Spacer(),
          CupButton(
            onPressed: () {
              context.push('/home/level').then((_) {
                if (context.mounted) {
                  print('GET COINS');
                  context.read<CoinsBloc>().add(GetCoinsEvent());
                }
              });
            },
            child: const CustomSvg('assets/play.svg'),
          ),
          const SizedBox(height: 18),
          CupButton(
            onPressed: () {
              context.push('/home/howto');
            },
            child: const CustomSvg('assets/howto.svg'),
          ),
          const SizedBox(height: 18),
          CupButton(
            onPressed: () {
              context.push('/home/settings');
            },
            child: const CustomSvg('assets/settings.svg'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
