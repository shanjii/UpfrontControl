import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ufc_app/app/data/datasources/input_datasource.dart';
import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/data/models/interfaces/ufc_interface.dart';
import 'package:ufc_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:ufc_app/app/presenters/global_presenters/data_presenter.dart';
import 'package:ufc_app/app/presenters/global_presenters/feedback_presenter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufc_app/core/enums/ufcs.dart';

class UfcPresenter {
  InputDatasource inputDatasource = InputDatasource();

  late ActivityPresenter activity;
  late FeedbackPresenter feedback;
  late DataPresenter data;

  UfcPresenter(BuildContext context) {
    activity = context.read<ActivityPresenter>();
    data = context.read<DataPresenter>();
    feedback = context.read<FeedbackPresenter>();
  }

  onPress(ActionModel action) {
    feedback.tapVibration();
    feedback.tapSound();

    inputDatasource.pressKey(action, data.connection);
  }

  onRelease(ActionModel action) {
    feedback.tapVibration();
    //Unsure about this one
    // feedback.tapSound();

    inputDatasource.releaseKey(action, data.connection);
  }

  saveUfcKeys(Ufcs module, Ufc keyValues) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      module.value,
      jsonEncode(keyValues.toJson()),
    );
  }
}
