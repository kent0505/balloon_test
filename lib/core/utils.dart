import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int coins = 0;
int sound = 0;
int music = 0;
int lastSpin = 0;

Future<void> getData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('onboard');
    // await prefs.clear();
    coins = prefs.getInt('coins') ?? 0;
    sound = prefs.getInt('sound') ?? 0;
    music = prefs.getInt('music') ?? 0;
    lastSpin = prefs.getInt('lastSpin') ?? 0;
  } catch (e) {
    logger(e);
  }
}

Future<void> saveInt(String key, int value) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  } catch (e) {
    logger(e);
  }
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

double getTop(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}
