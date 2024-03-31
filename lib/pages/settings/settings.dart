import 'package:app/providers/feedbacks.dart';
import 'package:app/providers/network.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var feedbacks = context.read<Feedbacks>();
    var network = context.read<Network>();

    TextEditingController ipController = TextEditingController(
      text: network.localIp,
    );

    return Scaffold(
      backgroundColor: DefaultColors.background,
      appBar: AppBar(
        backgroundColor: DefaultColors.background,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          _title("Server address"),
          _ipInput(ipController),
          _title("Button sounds"),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 60,
            child: Row(
              children: [
                _button(
                  title: "Unmuted",
                  onTap: () => feedbacks.unmute(),
                  condition: !feedbacks.muted,
                ),
                _button(
                  title: "Muted",
                  onTap: () => feedbacks.mute(),
                  condition: feedbacks.muted,
                ),
              ],
            ),
          ),
          _title("Button vibration"),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 60,
            child: Row(
              children: [
                _button(
                  title: "Light vibration",
                  onTap: () => feedbacks.setHaptic(FeedbackType.light),
                  condition: feedbacks.haptic == FeedbackType.light,
                ),
                _button(
                  title: "Medium vibration",
                  onTap: () => feedbacks.setHaptic(FeedbackType.medium),
                  condition: feedbacks.haptic == FeedbackType.medium,
                ),
                _button(
                  title: "Heavy vibration",
                  onTap: () => feedbacks.setHaptic(FeedbackType.heavy),
                  condition: feedbacks.haptic == FeedbackType.heavy,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _title(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
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
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _ipInput(TextEditingController ipController) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          suffix: const Text(":3000"),
          fillColor: DefaultColors.backgroundLight,
          border: InputBorder.none,
          hintText: "Your server IP address",
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        controller: ipController,
      ),
    );
  }
}
