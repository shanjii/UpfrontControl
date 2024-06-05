import 'package:flutter/material.dart';
import 'package:icp_app/data/models/f16_keys_model.dart';
import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/ui/pages/home/widgets/keybinder.dart';
import 'package:icp_app/ui/pages/home/widgets/multi_keybinder.dart';
import 'package:icp_app/ui/pages/f16/layouts/buttons/f16_dobber_button.dart';
import 'package:icp_app/ui/pages/f16/layouts/buttons/f16_keypad_button.dart';
import 'package:icp_app/ui/pages/f16/layouts/buttons/f16_switch.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/values/colors.dart';
import 'package:provider/provider.dart';

class F16KeybindsPage extends StatefulWidget {
  const F16KeybindsPage({super.key});

  @override
  State<F16KeybindsPage> createState() => _F16KeybindsState();
}

class _F16KeybindsState extends State<F16KeybindsPage> {
  late F16KeysModel keys;
  late Communication communication;

  @override
  Widget build(BuildContext context) {
    communication = context.read<Communication>();
    keys = communication.f16keysModel;

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
        children: [
          MultiKeybinder(
            button: const F16DobberButton(),
            keybinds: [
              keys.dobberUp,
              keys.dobberLeft,
              keys.dobberRight,
              keys.dobberDown,
            ],
            onAdd: setDobberKeybinds,
          ),
          MultiKeybinder(
            button: const F16Switch(),
            keybinds: [
              keys.drift,
              keys.norm,
              keys.warnReset,
            ],
            onAdd: setSwitchKeybinds,
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "T-ILS",
              label: "1",
              cornerLabel: "",
            ),
            keybind: keys.num1,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num1 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "ALOW",
              label: "2",
              cornerLabel: "N",
            ),
            keybind: keys.num2,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num2 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "",
              label: "3",
              cornerLabel: "",
            ),
            keybind: keys.num3,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num3 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "STPT",
              label: "4",
              cornerLabel: "W",
            ),
            keybind: keys.num4,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num4 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "CRUS",
              label: "5",
              cornerLabel: "",
            ),
            keybind: keys.num5,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num5 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "TIME",
              label: "6",
              cornerLabel: "E",
            ),
            keybind: keys.num6,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num6 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "MARK",
              label: "7",
              cornerLabel: "",
            ),
            keybind: keys.num7,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num7 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "FIX",
              label: "8",
              cornerLabel: "S",
            ),
            keybind: keys.num8,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num8 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "A-CAL",
              label: "9",
              cornerLabel: "",
            ),
            keybind: keys.num9,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num9 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "M-SEL",
              label: "0",
              cornerLabel: "━",
            ),
            keybind: keys.num0,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.num0 = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              label: "ENTR",
              functionButton: true,
            ),
            keybind: keys.entr,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.entr = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
          Keybinder(
            button: const F16KeypadButton(
              label: "RCL",
              functionButton: true,
            ),
            keybind: keys.rcl,
            onAdd: (newKeybind, index) {
              setState(() {
                keys.rcl = newKeybind;
                communication.setF16Keys();
              });
            },
          ),
        ],
      ),
    );
  }

  setDobberKeybinds(Keyboard? newKeybind, int index) {
    setState(() {
      switch (index) {
        case 0:
          keys.dobberUp = newKeybind;
        case 1:
          keys.dobberLeft = newKeybind;
        case 2:
          keys.dobberRight = newKeybind;
        case 3:
          keys.dobberDown = newKeybind;
      }
    });
    communication.setF16Keys();
  }

  setSwitchKeybinds(Keyboard? newKeybind, int index) {
    setState(() {
      switch (index) {
        case 0:
          keys.drift = newKeybind;
        case 1:
          keys.norm = newKeybind;
        case 2:
          keys.warnReset = newKeybind;
      }
    });
    communication.setF16Keys();
  }
}
