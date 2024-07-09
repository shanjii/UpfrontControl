import 'package:flutter/material.dart';
import 'package:ufc_app/app/data/models/payloads/f16_keys_model.dart';
import 'package:ufc_app/app/presenters/global_presenters/button_presenter.dart';
import 'package:ufc_app/app/ui/components/keybinder.dart';
import 'package:ufc_app/app/ui/components/multi_keybinder.dart';
import 'package:ufc_app/app/ui/components/text.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_dobber_button.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_keypad_button.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_rounded_button.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_rounded_solid_button.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_selector_button.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_switch.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:provider/provider.dart';

class F16KeybindsPage extends StatefulWidget {
  const F16KeybindsPage({super.key});

  @override
  State<F16KeybindsPage> createState() => _F16KeybindsState();
}

class _F16KeybindsState extends State<F16KeybindsPage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => UfcPresenter(context),
      child: Consumer(
        builder: (context, UfcPresenter controller, _) {
          F16KeysModel keys = controller.data.f16KeysValues;

          return Scaffold(
            backgroundColor: DefaultColors.gray4,
            appBar: AppBar(
              backgroundColor: DefaultColors.gray4,
              scrolledUnderElevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                "F16 Keybinds",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                if (controller.data.connection.virtualJoystick)
                  Container(
                    height: 50,
                    color: Colors.green,
                    child: Center(
                      child: defaultText("vJoy mode enabled", size: 20),
                    ),
                  ),
                Expanded(
                  child: ListView(
                    children: [
                      Keybinder(
                        button: const F16RoundedButton(
                          label: "COM",
                          secondLabel: "1",
                        ),
                        keybind: keys.com1,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.com1.key = key;
                            keys.com1.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16RoundedButton(
                          label: "COM",
                          secondLabel: "2",
                        ),
                        keybind: keys.com2,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.com2.key = key;
                            keys.com2.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16RoundedButton(
                          label: "IFF",
                        ),
                        keybind: keys.iff,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.iff.key = key;
                            keys.iff.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16RoundedButton(
                          label: "LIST",
                        ),
                        keybind: keys.list,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.list.key = key;
                            keys.list.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16RoundedButton(
                          label: "A-A",
                        ),
                        keybind: keys.aa,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.aa.key = key;
                            keys.aa.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16RoundedButton(
                          label: "A-G",
                        ),
                        keybind: keys.ag,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.ag.key = key;
                            keys.ag.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16KeypadButton(
                          topLabel: "T-ILS",
                          label: "1",
                          cornerLabel: "",
                        ),
                        keybind: keys.num1,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num1.key = key;
                            keys.num1.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num2.key = key;
                            keys.num2.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num3.key = key;
                            keys.num3.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num4.key = key;
                            keys.num4.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num5.key = key;
                            keys.num5.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num6.key = key;
                            keys.num6.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num7.key = key;
                            keys.num7.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num8.key = key;
                            keys.num8.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num9.key = key;
                            keys.num9.modifier = modifier;
                            controller.setF16Keys();
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
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.num0.key = key;
                            keys.num0.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16KeypadButton(
                          label: "ENTR",
                          functionButton: true,
                        ),
                        keybind: keys.entr,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.entr.key = key;
                            keys.entr.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16KeypadButton(
                          label: "RCL",
                          functionButton: true,
                        ),
                        keybind: keys.rcl,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.rcl.key = key;
                            keys.rcl.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      Keybinder(
                        button: const F16RoundedSolidButton(
                          label: "WX",
                        ),
                        keybind: keys.wx,
                        onAdd: (key, modifier, index) {
                          setState(() {
                            keys.wx.key = key;
                            keys.wx.modifier = modifier;
                            controller.setF16Keys();
                          });
                        },
                      ),
                      _multiKeybindRegion(
                        children: [
                          _title(
                            title: "Step switch",
                            subtitle: "UP - DOWN",
                          ),
                          MultiKeybinder(
                            button: const F16SelectorButton(
                              labelUp: "▲",
                              labelDown: "▼",
                            ),
                            square: false,
                            keybinds: [
                              keys.stepUp,
                              keys.stepDown,
                            ],
                            onAdd: (key, modifier, index) {
                              _setStepperKeybinds(key, modifier, index, keys);
                              controller.setF16Keys();
                            },
                          ),
                          _title(
                            title: "Flir switch",
                            subtitle: "UP - DOWN",
                          ),
                          MultiKeybinder(
                            button: const F16SelectorButton(
                              labelUp: "+",
                              labelDown: "-",
                            ),
                            square: false,
                            keybinds: [
                              keys.flirUp,
                              keys.flirDown,
                            ],
                            onAdd: (key, modifier, index) {
                              _setFlirKeybinds(key, modifier, index, keys);
                              controller.setF16Keys();
                            },
                          ),
                          _title(
                            title: "Dobber switch ",
                            subtitle: "UP - LEFT - RIGHT - DOWN",
                          ),
                          MultiKeybinder(
                            button: const F16DobberButton(),
                            keybinds: [
                              keys.dobberUp,
                              keys.dobberLeft,
                              keys.dobberRight,
                              keys.dobberDown,
                            ],
                            onAdd: (key, modifier, index) {
                              _setDobberKeybinds(key, modifier, index, keys);
                              controller.setF16Keys();
                            },
                          ),
                          _title(
                            title: "Drift switch ",
                            subtitle: "UP - CENTER - DOWN",
                          ),
                          MultiKeybinder(
                            button: const F16Switch(),
                            keybinds: [
                              keys.drift,
                              keys.norm,
                              keys.warnReset,
                            ],
                            onAdd: (key, modifier, index) {
                              _setSwitchKeybinds(key, modifier, index, keys);
                              controller.setF16Keys();
                            },
                          ),
                        ],
                      )
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

  _multiKeybindRegion({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            height: 4,
            color: DefaultColors.gray1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ],
      ),
    );
  }

  _title({required String title, String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          defaultText(title, size: 25),
          const SizedBox(height: 5),
          if (subtitle != null) defaultText(subtitle, size: 15),
        ],
      ),
    );
  }

  _setDobberKeybinds(
      String? key, String? modifier, int index, F16KeysModel keys) {
    setState(() {
      switch (index) {
        case 0:
          keys.dobberUp.key = key;
        case 1:
          keys.dobberLeft.key = key;
        case 2:
          keys.dobberRight.key = key;
        case 3:
          keys.dobberDown.key = key;
      }
    });
  }

  _setStepperKeybinds(
      String? key, String? modifier, int index, F16KeysModel keys) {
    setState(() {
      switch (index) {
        case 0:
          keys.stepUp.key = key;
          keys.stepUp.modifier = modifier;
        case 1:
          keys.stepDown.key = key;
          keys.stepDown.modifier = modifier;
      }
    });
  }

  _setFlirKeybinds(
      String? key, String? modifier, int index, F16KeysModel keys) {
    setState(() {
      switch (index) {
        case 0:
          keys.flirUp.key = key;
          keys.flirUp.modifier = modifier;
        case 1:
          keys.flirDown.key = key;
          keys.flirDown.modifier = modifier;
      }
    });
  }

  _setSwitchKeybinds(
      String? key, String? modifier, int index, F16KeysModel keys) {
    setState(() {
      switch (index) {
        case 0:
          keys.drift.key = key;
          keys.drift.modifier = modifier;
        case 1:
          keys.norm.key = key;
          keys.norm.modifier = modifier;
        case 2:
          keys.warnReset.key = key;
          keys.warnReset.modifier = modifier;
      }
    });
  }
}
