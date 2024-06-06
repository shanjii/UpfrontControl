import 'package:flutter/material.dart';
import 'package:icp_app/app/data/datasources/input_datasource.dart';
import 'package:icp_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/configuration_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/feedback_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/tool_presenter.dart';
import 'package:icp_app/core/values/buttons.dart';
import 'package:provider/provider.dart';

class F16Presenter {
  InputDatasource inputDatasource = InputDatasource();

  late ActivityPresenter activity;
  late FeedbackPresenter feedback;
  late ConfigurationPresenter configuration;
  late ToolPresenter tool;

  F16Presenter(BuildContext context) {
    activity = context.read<ActivityPresenter>();
    configuration = context.read<ConfigurationPresenter>();
    feedback = context.read<FeedbackPresenter>();
    tool = context.read<ToolPresenter>();
  }

  onPress(Keyboard? key) {
    feedback.tapVibration();
    feedback.tapSound();

    if (key == null) return;
    inputDatasource.pressKey(key, configuration.connection);
  }

  onRelease(Keyboard? key) {
    feedback.tapVibration();
    feedback.tapSound();

    if (key == null) return;
    inputDatasource.releaseKey(key, configuration.connection);
  }
}
