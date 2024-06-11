import 'package:icp_app/app/presenters/global_presenters/configuration_presenter.dart';
import 'package:icp_app/app/presenters/settings_presenter.dart';
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
    return Provider(
      create: (context) => SettingsPresenter(context),
      child: Consumer(
        builder: (context, SettingsPresenter controller, _) {
          var feedback = controller.feedback;
          var activity = controller.activity;

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
                _ipInput(controller.ipController, controller.portController),
                _title("Button sounds"),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 60,
                  child: Row(
                    children: [
                      _button(
                        title: "OFF",
                        onTap: () => feedback.mute(),
                        condition: feedback.muted,
                      ),
                      _button(
                        title: "ON",
                        onTap: () => feedback.unmute(),
                        condition: !feedback.muted,
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
                        onTap: () => feedback.setHaptic(null),
                        condition: feedback.haptic == null,
                      ),
                      _button(
                        title: "Light",
                        onTap: () => feedback.setHaptic(FeedbackType.light),
                        condition: feedback.haptic == FeedbackType.light,
                      ),
                      _button(
                        title: "Medium",
                        onTap: () => feedback.setHaptic(FeedbackType.medium),
                        condition: feedback.haptic == FeedbackType.medium,
                      ),
                      _button(
                        title: "Heavy",
                        onTap: () => feedback.setHaptic(FeedbackType.heavy),
                        condition: feedback.haptic == FeedbackType.heavy,
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
      ),
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
          onTap: () async {
            await onTap();
            setState(() {});
          },
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
    ConfigurationPresenter configuration =
        context.read<ConfigurationPresenter>();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: inputField(
              onChanged: (value) => configuration.setLocalIp(value),
              fillColors: DefaultColors.backgroundLight,
              controller: ipController,
              hint: "IP address",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: inputField(
              onChanged: (value) => configuration.setPort(value),
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
