import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int coins = 0;
int sound = 0;
int music = 0;
int lastSpin = 0;

Future<void> getData() async {
  try {
    await SharedPreferences.getInstance().then((prefs) async {
      // await prefs.clear();
      coins = prefs.getInt('coins') ?? 0;
      sound = prefs.getInt('sound') ?? 0;
      music = prefs.getInt('music') ?? 0;
      lastSpin = prefs.getInt('lastSpin') ?? 0;
    });
  } catch (e) {
    logger(e);
  }
}

Future<void> saveInt(String key, int value) async {
  try {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setInt(key, value);
    });
  } catch (e) {
    logger(e);
  }
}

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

double getTop(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}
