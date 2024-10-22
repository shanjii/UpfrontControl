import 'package:ufc_app/app/presentation/ui/pages/options/options_provider.dart';
import 'package:ufc_app/app/presentation/ui/components/inputs.dart';
import 'package:ufc_app/app/presentation/ui/components/text.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({super.key});

  @override
  State<OptionsPage> createState() => _SettingsState();
}

class _SettingsState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => OptionsProvider(context),
      child: Consumer<OptionsProvider>(
        builder: (context, controller, _) {
          return Scaffold(
            backgroundColor: DefaultColors.gray4,
            appBar: AppBar(
              backgroundColor: DefaultColors.gray4,
              scrolledUnderElevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
              title: defaultText("Settings", size: 23),
            ),
            body: ListView(
              children: [
                _title("Server address"),
                _ipInput(controller),
                _title("vJoy mode"),
                _subTitle(
                  "Use vJoy buttons instead of keyboard bindings. While this is active, all your keybinds will be ignored.",
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 60,
                  child: Row(
                    children: [
                      _button(
                        title: "OFF",
                        onTap: () => controller.setVirtualJoystick(false),
                        condition: !controller.data.connection.virtualJoystick,
                      ),
                      _button(
                        title: "ON",
                        onTap: () => controller.setVirtualJoystick(true),
                        condition: controller.data.connection.virtualJoystick,
                      ),
                    ],
                  ),
                ),
                _title("Mute sounds"),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 60,
                  child: Row(
                    children: [
                      _button(
                        title: "OFF",
                        onTap: () => controller.setSound(false),
                        condition: !controller.feedback.muted,
                      ),
                      _button(
                        title: "ON",
                        onTap: () => controller.setSound(true),
                        condition: controller.feedback.muted,
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
                        onTap: () => controller.setHaptic(null),
                        condition: controller.feedback.haptic == null,
                      ),
                      _button(
                        title: "Light",
                        onTap: () => controller.setHaptic(FeedbackType.light),
                        condition:
                            controller.feedback.haptic == FeedbackType.light,
                      ),
                      _button(
                        title: "Medium",
                        onTap: () => controller.setHaptic(FeedbackType.medium),
                        condition:
                            controller.feedback.haptic == FeedbackType.medium,
                      ),
                      _button(
                        title: "Heavy",
                        onTap: () => controller.setHaptic(FeedbackType.heavy),
                        condition:
                            controller.feedback.haptic == FeedbackType.heavy,
                      ),
                    ],
                  ),
                ),
                _title("Turn screen black on innactivity"),
                _subTitle(
                  "Useful on OLED screens to prevent burn-in, touch screen to restore.",
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 60,
                  child: Row(
                    children: [
                      _button(
                        title: "OFF",
                        onTap: () => controller.setOledMode(false),
                        condition: !controller.activity.manageActivity,
                      ),
                      _button(
                        title: "ON",
                        onTap: () => controller.setOledMode(true),
                        condition: controller.activity.manageActivity,
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
      child: defaultText(title, size: 14),
    );
  }

  _button({
    required String title,
    required Function() onTap,
    required bool condition,
  }) {
    return Expanded(
      child: Material(
        color: condition ? DefaultColors.gray2 : DefaultColors.gray1,
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

  _ipInput(OptionsProvider controller) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: inputField(
              onChanged: (value) => controller.setLocalIp(value),
              fillColors: DefaultColors.gray1,
              controller: controller.ipController,
              hint: "IP address",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: inputField(
              onChanged: (value) => controller.setPort(value),
              fillColors: DefaultColors.gray2,
              controller: controller.portController,
              hint: "Port",
            ),
          ),
        ],
      ),
    );
  }
}
