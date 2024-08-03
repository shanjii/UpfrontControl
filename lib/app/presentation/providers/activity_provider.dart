import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:ufc_app/app/data/datasources/local/settings_datasource.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ActivityProvider extends ChangeNotifier {
  bool isActive = true;
  late int innactivityTime;
  late bool manageActivity;
  late RestartableTimer timer;

  final SettingsDatasource settingsDatasource = SettingsDatasource();

  ActivityProvider() {
    _init();
  }

  _init() async {
    manageActivity = await settingsDatasource.getOledMode();
    innactivityTime = 15;
  }

  start() async {
    //Prevent device from sleeping
    await WakelockPlus.enable();

    isActive = true;
    timer = RestartableTimer(Duration(seconds: innactivityTime), () {
      //Ignore if manage activity is off in settings
      if (!manageActivity) return;
      isActive = false;
      notifyListeners();
    });
  }

  stop() async {
    await WakelockPlus.disable();
    timer.cancel();
  }

  resetTimer() {
    //Ignore if manage activity is off in settings
    if (!manageActivity) return;
    isActive = true;
    timer.reset();
    notifyListeners();
  }
}
