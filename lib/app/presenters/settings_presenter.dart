import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:ufc_app/app/data/models/connection_model.dart';
import 'package:ufc_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:ufc_app/app/presenters/global_presenters/data_presenter.dart';
import 'package:ufc_app/app/presenters/global_presenters/feedback_presenter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPresenter {
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();

  late ActivityPresenter activity;
  late FeedbackPresenter feedback;
  late DataPresenter data;

  SettingsPresenter(BuildContext context) {
    activity = context.read<ActivityPresenter>();
    data = context.read<DataPresenter>();
    feedback = context.read<FeedbackPresenter>();

    ipController.text = data.connection.ip;
    portController.text = data.connection.port;
  }

  setLocalIp(String newIp) async {
    data.connection = ConnectionModel(
      ip: newIp,
      port: data.connection.port,
    );

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('ip', newIp);
  }

  setPort(String newPort) async {
    data.connection = ConnectionModel(
      ip: data.connection.ip,
      port: newPort,
    );

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('port', newPort);
  }

  setSound(bool value) async {
    feedback.muted = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('muted', value);
  }

  setHaptic(FeedbackType? type) async {
    final prefs = await SharedPreferences.getInstance();
    feedback.haptic = type;

    if (type == null) {
      await prefs.setString('haptic', "off");
    } else {
      await prefs.setString('haptic', type.name.toString());
    }
  }

  setOledMode(bool value) async {
    activity.manageActivity = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('manage-activity', value);
  }

  setVirtualJoystick(bool value) async {
    data.connection.virtualJoystick = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('virtual-joystick', value);
  }
}
