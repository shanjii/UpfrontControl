import 'package:flutter/material.dart';
import 'package:icp_app/app/data/datasources/input_datasource.dart';
import 'package:icp_app/app/data/models/payloads/action_model.dart';
import 'package:icp_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/configuration_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/feedback_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/tool_presenter.dart';
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

  onPress(ActionModel action) {
    feedback.tapVibration();
    feedback.tapSound();

    inputDatasource.pressKey(action, configuration.connection);
  }

  onRelease(ActionModel action) {
    feedback.tapVibration();
    //Unsure about this one
    // feedback.tapSound();

    inputDatasource.releaseKey(action, configuration.connection);
  }
}
