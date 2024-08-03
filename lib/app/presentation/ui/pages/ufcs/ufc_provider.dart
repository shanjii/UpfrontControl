import 'package:flutter/material.dart';
import 'package:ufc_app/app/data/datasources/local/settings_datasource.dart';
import 'package:ufc_app/app/data/datasources/remote/input_datasource.dart';
import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/data/models/interfaces/ufc_interface.dart';
import 'package:ufc_app/app/presentation/providers/activity_provider.dart';
import 'package:ufc_app/app/presentation/providers/settings_provider.dart';
import 'package:ufc_app/app/presentation/providers/feedback_provider.dart';
import 'package:provider/provider.dart';
import 'package:ufc_app/core/enums/ufcs.dart';

class UfcProvider {
  late RemoteDatasource remote;
  late ActivityProvider activity;
  late FeedbackProvider feedback;
  late SettingsProvider data;

  final SettingsDatasource moduleDatasource = SettingsDatasource();

  UfcProvider(BuildContext context) {
    activity = context.read<ActivityProvider>();
    data = context.read<SettingsProvider>();
    feedback = context.read<FeedbackProvider>();
    remote = RemoteDatasource(data.connection);
  }

  onPress(ActionModel action) {
    feedback.tapVibration();
    feedback.tapSound();

    remote.pressKey(action);
  }

  onRelease(ActionModel action) {
    feedback.tapVibration();
    //Unsure about this one
    // feedback.tapSound();

    remote.releaseKey(action);
  }

  save(Ufcs module, Ufc keyValues) async {
    moduleDatasource.saveKeys(module, keyValues);
  }
}
