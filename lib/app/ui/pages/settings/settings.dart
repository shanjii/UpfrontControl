import 'package:icp_app/app/presenters/activity_presenter.dart';
import 'package:icp_app/app/presenters/feedback_presenter.dart';
import 'package:icp_app/app/presenters/communication_presenter.dart';
import 'package:icp_app/app/ui/components/inputs.dart';
import 'package:icp_app/app/ui/components/text.dart';
import 'package:icp_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController ipController = TextEditingController();
    TextEditingController portController = TextEditingController();

    return Consumer3(
      //TODO: replace with a Provider that creates a settings presenter that inherits the context and instances of the other presenters inside it.
      builder: (
        context,
        FeedbackPresenter feedbacks,
        CommunicationPresenter communication,
        ActivityPresenter activity,
        widget,
      ) {
        ipController.text = communication.connection.ip;
        portController.text = communication.connection.port;
        return Scaffold(
          backgroundColor: DefaultColors.background,
          appBar: AppBar(
            backgroundColor: DefaultColors.background,
            scrolledUnderElevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            title: defaultText("Settings", size: 23),
          ),
          body: ListView(
            children: [
              _title("Server address"),
              _ipInput(ipController, portController),
              _title("Button sounds"),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 60,
                child: Row(
                  children: [
                    _button(
                      title: "OFF",
                      onTap: () => feedbacks.mute(),
                      condition: feedbacks.muted,
                    ),
                    _button(
                      title: "ON",
                      onTap: () => feedbacks.unmute(),
                      condition: !feedbacks.muted,
                    ),
                  ],
                ),
              ),
              _title("Button vibration"),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 60,
                child: Row(
                  children: [
                    _button(
                      title: "OFF",
                      onTap: () => feedbacks.setHaptic(null),
                      condition: feedbacks.haptic == null,
                    ),
                    _button(
                      title: "Light",
                      onTap: () => feedbacks.setHaptic(FeedbackType.light),
                      condition: feedbacks.haptic == FeedbackType.light,
                    ),
                    _button(
                      title: "Medium",
                      onTap: () => feedbacks.setHaptic(FeedbackType.medium),
                      condition: feedbacks.haptic == FeedbackType.medium,
                    ),
                    _button(
                      title: "Heavy",
                      onTap: () => feedbacks.setHaptic(FeedbackType.heavy),
                      condition: feedbacks.haptic == FeedbackType.heavy,
                    ),
                  ],
                ),
              ),
              _title("Turn screen black on innactivity"),
              _subTitle(
                "(Useful on OLED screens to prevent burn-in, touch screen to restore)",
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 60,
                child: Row(
                  children: [
                    _button(
                      title: "OFF",
                      onTap: () => activity.disable(),
                      condition: !activity.manageActivity,
                    ),
                    _button(
                      title: "ON",
                      onTap: () => activity.enable(),
                      condition: activity.manageActivity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _title(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 15),
      child: defaultText(title, size: 24),
    );
  }

  _subTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 5),
      child: defaultText(title, size: 16),
    );
  }

  _button({
    required String title,
    required Function() onTap,
    required bool condition,
  }) {
    return Expanded(
      child: Material(
        color: condition
            ? DefaultColors.backgroundLight2
            : DefaultColors.backgroundLight,
        child: InkWell(
          onTap: () => setState(() {
            onTap();
          }),
          child: Center(
            child: defaultText(title, size: 18),
          ),
        ),
      ),
    );
  }

  _ipInput(
    TextEditingController ipController,
    TextEditingController portController,
  ) {
    CommunicationPresenter communication =
        context.read<CommunicationPresenter>();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: inputField(
              onChanged: (value) => communication.setLocalIp(value),
              fillColors: DefaultColors.backgroundLight,
              controller: ipController,
              hint: "IP address",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: inputField(
              onChanged: (value) => communication.setPort(value),
              fillColors: DefaultColors.backgroundLight2,
              controller: portController,
              hint: "Port",
            ),
          ),
        ],
      ),
    );
  }
}
