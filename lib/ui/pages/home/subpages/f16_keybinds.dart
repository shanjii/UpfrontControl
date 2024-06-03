import 'package:flutter/material.dart';
import 'package:icp_app/ui/pages/f16/unique_buttons/f16_dobber_button.dart';
import 'package:icp_app/ui/pages/f16/unique_buttons/f16_keypad_button.dart';
import 'package:icp_app/ui/pages/f16/unique_buttons/f16_switch.dart';
import 'package:icp_app/values/colors.dart';

class F16KeybindsPage extends StatefulWidget {
  const F16KeybindsPage({super.key});

  @override
  State<F16KeybindsPage> createState() => _F16KeybindsState();
}

class _F16KeybindsState extends State<F16KeybindsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.background,
      appBar: AppBar(
        backgroundColor: DefaultColors.background,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "F16 Keybinds",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buttonRow(
            const F16DobberButton(
              sentValueUp: null,
              sentValueLeft: null,
              sentValueDown: null,
              sentValueRight: null,
            ),
          ),
          _buttonRow(
            const F16Switch(
              sentValueWrnRst: null,
              sentValueNorm: null,
              sentValueDrift: null,
            ),
          ),
          _buttonRow(
            const F16KeypadButton(
              topLabel: "T-ILS",
              label: "1",
              cornerLabel: "",
              sentValue: null,
            ),
          ),
          _buttonRow(
            const F16KeypadButton(
              topLabel: "ALOW",
              label: "2",
              cornerLabel: "N",
              sentValue: null,
            ),
          ),
          _buttonRow(
            const F16KeypadButton(
              topLabel: "",
              label: "3",
              cornerLabel: "",
              sentValue: null,
            ),
          ),
          _buttonRow(
            const F16KeypadButton(
              label: "RCL",
              functionButton: true,
              sentValue: null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonRow(Widget button) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: button,
          ),
        ],
      ),
    );
  }
}
