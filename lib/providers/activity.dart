import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

class Activity extends ChangeNotifier {
  bool isActive = true;
  int innactivityTime;
  bool manageActivity;
  late RestartableTimer timer;

  Activity({required this.innactivityTime, required this.manageActivity});

  start() async {
    //Prevent device from sleeping
    await Wakelock.enable();

    isActive = true;
    timer = RestartableTimer(Duration(seconds: innactivityTime), () {
      //Ignore if manage activity is off in settings
      if (!manageActivity) return;
      isActive = false;
      notifyListeners();
    });
  }

  stop() async {
    await Wakelock.disable();
    timer.cancel();
  }

  resetTimer() {
    //Ignore if manage activity is off in settings
    if (!manageActivity) return;
    isActive = true;
    timer.reset();
    notifyListeners();
  }

  enable() async {
    manageActivity = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('manage-activity', true);
  }

  disable() async {
    manageActivity = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('manage-activity', false);
  }
}
