import 'package:flutter/material.dart';
import 'package:icp_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/configuration_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/feedback_presenter.dart';
import 'package:provider/provider.dart';

class SettingsPresenter {
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();

  late ActivityPresenter activity;
  late FeedbackPresenter feedback;
  late ConfigurationPresenter configuration;

  SettingsPresenter(BuildContext context) {
    activity = context.read<ActivityPresenter>();
    configuration = context.read<ConfigurationPresenter>();
    feedback = context.read<FeedbackPresenter>();

    ipController.text = configuration.connection.ip;
    portController.text = configuration.connection.port;
  }
}
