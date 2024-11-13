import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/utils.dart';
import '../widgets/cup_button.dart';
import '../widgets/custom_svg.dart';
import '../widgets/custom_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int soundIndex = 0;
  int musicIndex = 0;

  void onSound(bool plus) async {
    if (plus) {
      if (soundIndex <= 5) {
        soundIndex++;
      } else {
        return;
      }
    } else {
      if (soundIndex >= 1) {
        soundIndex--;
      } else {
        return;
      }
    }
    sound = soundIndex;
    await saveInt('sound', sound);
    setState(() {});
  }

  void onMusic(bool plus) async {
    if (plus) {
      if (musicIndex <= 5) {
        musicIndex++;
      } else {
        return;
      }
    } else {
      if (musicIndex >= 1) {
        musicIndex--;
      } else {
        return;
      }
    }
    music = musicIndex;
    await saveInt('music', music);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    soundIndex = sound;
    musicIndex = music;
  }

  @override
  Widget build(BuildContext context) {
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
            bottom: 117,
            left: 90,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                'assets/images/cloud.png',
                height: 74,
              ),
            ),
          ),
          Positioned(
            top: 140,
            right: 58,
            child: Transform.scale(
              scaleX: -1,
              child: Image.asset(
                'assets/images/cloud.png',
                height: 74,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 16 + getTop(context)),
                const CustomText(
                  'Settings',
                  fontSize: 44,
                ),
                const SizedBox(height: 40),
                const CustomText(
                  'Sounds',
                  fontSize: 22,
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupButton(
                      onPressed: () {
                        onSound(false);
                      },
                      child: const CustomSvg('assets/minus.svg'),
                    ),
                    const SizedBox(width: 20),
                    _Indicator(active: soundIndex >= 1),
                    const SizedBox(width: 18),
                    _Indicator(active: soundIndex >= 2),
                    const SizedBox(width: 18),
                    _Indicator(active: soundIndex >= 3),
                    const SizedBox(width: 18),
                    _Indicator(active: soundIndex >= 4),
                    const SizedBox(width: 18),
                    _Indicator(active: soundIndex >= 5),
                    const SizedBox(width: 18),
                    _Indicator(active: soundIndex >= 6),
                    const SizedBox(width: 20),
                    CupButton(
                      onPressed: () {
                        onSound(true);
                      },
                      child: const CustomSvg('assets/plus.svg'),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const CustomText(
                  'Music',
                  fontSize: 22,
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupButton(
                      onPressed: () {
                        onMusic(false);
                      },
                      child: const CustomSvg('assets/minus.svg'),
                    ),
                    const SizedBox(width: 20),
                    _Indicator(active: musicIndex >= 1),
                    const SizedBox(width: 18),
                    _Indicator(active: musicIndex >= 2),
                    const SizedBox(width: 18),
                    _Indicator(active: musicIndex >= 3),
                    const SizedBox(width: 18),
                    _Indicator(active: musicIndex >= 4),
                    const SizedBox(width: 18),
                    _Indicator(active: musicIndex >= 5),
                    const SizedBox(width: 18),
                    _Indicator(active: musicIndex >= 6),
                    const SizedBox(width: 20),
                    CupButton(
                      onPressed: () {
                        onMusic(true);
                      },
                      child: const CustomSvg('assets/plus.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
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

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.active,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 35,
      width: 15,
      decoration: BoxDecoration(
        color: active ? const Color(0xff25A7DF) : const Color(0xff8BAEBD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
