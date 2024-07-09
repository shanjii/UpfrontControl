import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:icp_app/app/data/datasources/input_datasource.dart';
import 'package:icp_app/app/data/models/payloads/action_model.dart';
import 'package:icp_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/data_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/feedback_presenter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonPresenter {
  InputDatasource inputDatasource = InputDatasource();

  late ActivityPresenter activity;
  late FeedbackPresenter feedback;
  late DataPresenter data;

  ButtonPresenter(BuildContext context) {
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

  setF16Keys() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'f16Keys',
      jsonEncode(data.f16KeysValues.toJson()),
    );
  }
}
