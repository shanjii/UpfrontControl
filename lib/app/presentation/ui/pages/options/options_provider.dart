import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:ufc_app/app/data/datasources/local/settings_datasource.dart';
import 'package:ufc_app/app/presentation/providers/activity_provider.dart';
import 'package:ufc_app/app/presentation/providers/settings_provider.dart';
import 'package:ufc_app/app/presentation/providers/feedback_provider.dart';
import 'package:provider/provider.dart';

class OptionsProvider {
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();

  late ActivityProvider activity;
  late FeedbackProvider feedback;
  late SettingsProvider data;

  final SettingsDatasource settingsDatasource = SettingsDatasource();

  OptionsProvider(BuildContext context) {
    activity = context.read<ActivityProvider>();
    data = context.read<SettingsProvider>();
    feedback = context.read<FeedbackProvider>();

    ipController.text = data.connection.ip;
    portController.text = data.connection.port;
  }

  setLocalIp(String newIp) async {
    data.connection.ip = newIp;
    settingsDatasource.setConnectionSettings(data.connection);
  }

  setPort(String newPort) async {
    data.connection.port = newPort;
    settingsDatasource.setConnectionSettings(data.connection);
  }

  setSound(bool value) async {
    feedback.muted = value;
    settingsDatasource.setSound(value);
  }

  setHaptic(FeedbackType? type) async {
    feedback.haptic = type;
    settingsDatasource.setHaptic(type);
  }

  setOledMode(bool value) async {
    activity.manageActivity = value;
    settingsDatasource.setOledMode(value);
  }

  setVirtualJoystick(bool value) async {
    data.connection.virtualJoystick = value;
    settingsDatasource.setConnectionSettings(data.connection);
  }
}
