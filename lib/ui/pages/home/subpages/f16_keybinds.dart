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
  late F16KeysModel f16Keys;

  @override
  Widget build(BuildContext context) {
    f16Keys = context.read<Communication>().f16keysModel;

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
              f16Keys.dobberUp,
              f16Keys.dobberLeft,
              f16Keys.dobberRight,
              f16Keys.dobberDown,
            ],
            onAdd: setDobberKeybinds,
          ),
          MultiKeybinder(
            button: const F16Switch(),
            keybinds: [
              f16Keys.drift,
              f16Keys.norm,
              f16Keys.warnReset,
            ],
            onAdd: setSwitchKeybinds,
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "T-ILS",
              label: "1",
              cornerLabel: "",
            ),
            keybind: f16Keys.num1,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num1 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "ALOW",
              label: "2",
              cornerLabel: "N",
            ),
            keybind: f16Keys.num2,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num2 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "",
              label: "3",
              cornerLabel: "",
            ),
            keybind: f16Keys.num3,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num3 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "STPT",
              label: "4",
              cornerLabel: "W",
            ),
            keybind: f16Keys.num4,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num4 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "CRUS",
              label: "5",
              cornerLabel: "",
            ),
            keybind: f16Keys.num5,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num5 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "TIME",
              label: "6",
              cornerLabel: "E",
            ),
            keybind: f16Keys.num6,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num6 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "MARK",
              label: "7",
              cornerLabel: "",
            ),
            keybind: f16Keys.num7,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num7 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "FIX",
              label: "8",
              cornerLabel: "S",
            ),
            keybind: f16Keys.num8,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num8 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "A-CAL",
              label: "9",
              cornerLabel: "",
            ),
            keybind: f16Keys.num9,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num9 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              topLabel: "M-SEL",
              label: "0",
              cornerLabel: "━",
            ),
            keybind: f16Keys.num0,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.num0 = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              label: "ENTR",
              functionButton: true,
            ),
            keybind: f16Keys.entr,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.entr = newKeybind;
            }),
          ),
          Keybinder(
            button: const F16KeypadButton(
              label: "RCL",
              functionButton: true,
            ),
            keybind: f16Keys.rcl,
            onAdd: (newKeybind, index) => setState(() {
              f16Keys.rcl = newKeybind;
            }),
          ),
        ],
      ),
    );
  }

  setDobberKeybinds(Keyboard? newKeybind, int index) {
    setState(() {
      switch (index) {
        case 0:
          f16Keys.dobberUp = newKeybind;
        case 1:
          f16Keys.dobberLeft = newKeybind;
        case 2:
          f16Keys.dobberRight = newKeybind;
        case 3:
          f16Keys.dobberDown = newKeybind;
      }
    });
  }

  setSwitchKeybinds(Keyboard? newKeybind, int index) {
    setState(() {
      switch (index) {
        case 0:
          f16Keys.drift = newKeybind;
        case 1:
          f16Keys.norm = newKeybind;
        case 2:
          f16Keys.warnReset = newKeybind;
      }
    });
  }
}
