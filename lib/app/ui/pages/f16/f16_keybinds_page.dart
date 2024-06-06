import 'package:flutter/material.dart';
import 'package:icp_app/app/data/models/f16_keys_model.dart';
import 'package:icp_app/app/presenters/f16_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/configuration_presenter.dart';
import 'package:icp_app/app/ui/components/keybinder.dart';
import 'package:icp_app/app/ui/components/multi_keybinder.dart';
import 'package:icp_app/app/ui/components/text.dart';
import 'package:icp_app/app/ui/pages/f16/buttons/f16_dobber_button.dart';
import 'package:icp_app/app/ui/pages/f16/buttons/f16_keypad_button.dart';
import 'package:icp_app/app/ui/pages/f16/buttons/f16_rounded_button.dart';
import 'package:icp_app/app/ui/pages/f16/buttons/f16_rounded_solid_button.dart';
import 'package:icp_app/app/ui/pages/f16/buttons/f16_selector_button.dart';
import 'package:icp_app/app/ui/pages/f16/buttons/f16_switch.dart';
import 'package:icp_app/core/values/buttons.dart';
import 'package:icp_app/core/values/colors.dart';
import 'package:provider/provider.dart';

class F16KeybindsPage extends StatefulWidget {
  const F16KeybindsPage({super.key});

  @override
  State<F16KeybindsPage> createState() => _F16KeybindsState();
}

class _F16KeybindsState extends State<F16KeybindsPage> {
  late F16KeysModel keys;
  late ConfigurationPresenter configuration;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => F16Presenter(context),
      child: Consumer(
        builder: (context, F16Presenter controller, _) {
          keys = controller.configuration.f16KeysValues;
          configuration = controller.configuration;

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
                Keybinder(
                  button: const F16RoundedButton(
                    label: "COM",
                    secondLabel: "1",
                  ),
                  keybind: keys.com1,
                  onAdd: (newKeybind, index) {
                    setState(() {
                      keys.com1 = newKeybind;
                      configuration.setF16Keys();
                    });
                  },
                ),
                Keybinder(
                  button: const F16RoundedButton(
                    label: "COM",
                    secondLabel: "2",
                  ),
                  keybind: keys.com2,
                  onAdd: (newKeybind, index) {
                    setState(() {
                      keys.com2 = newKeybind;
                      configuration.setF16Keys();
                    });
                  },
                ),
                Keybinder(
                  button: const F16RoundedButton(
                    label: "IFF",
                  ),
                  keybind: keys.iff,
                  onAdd: (newKeybind, index) {
                    setState(() {
                      keys.iff = newKeybind;
                      configuration.setF16Keys();
                    });
                  },
                ),
                Keybinder(
                  button: const F16RoundedButton(
                    label: "LIST",
                  ),
                  keybind: keys.list,
                  onAdd: (newKeybind, index) {
                    setState(() {
                      keys.list = newKeybind;
                      configuration.setF16Keys();
                    });
                  },
                ),
                Keybinder(
                  button: const F16RoundedButton(
                    label: "A-A",
                  ),
                  keybind: keys.aa,
                  onAdd: (newKeybind, index) {
                    setState(() {
                      keys.aa = newKeybind;
                      configuration.setF16Keys();
                    });
                  },
                ),
                Keybinder(
                  button: const F16RoundedButton(
                    label: "A-G",
                  ),
                  keybind: keys.ag,
                  onAdd: (newKeybind, index) {
                    setState(() {
                      keys.ag = newKeybind;
                      configuration.setF16Keys();
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
                  onAdd: (newKeybind, index) {
                    setState(() {
                      keys.num1 = newKeybind;
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
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
                      configuration.setF16Keys();
                    });
                  },
                ),
                Keybinder(
                  button: const F16RoundedSolidButton(
                    label: "WX",
                  ),
                  keybind: keys.wx,
                  onAdd: (newKeybind, index) {
                    setState(() {
                      keys.wx = newKeybind;
                      configuration.setF16Keys();
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
                        keys.dobberUp,
                        keys.dobberLeft,
                      ],
                      onAdd: _setStepperKeybinds,
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
                      onAdd: _setFlirKeybinds,
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
                      onAdd: _setDobberKeybinds,
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
                      onAdd: _setSwitchKeybinds,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  _multiKeybindRegion({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: DefaultColors.backgroundLight,
          border: Border.all(color: DefaultColors.backgroundLight, width: 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
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

  _setDobberKeybinds(Keyboard? newKeybind, int index) {
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
    configuration.setF16Keys();
  }

  _setStepperKeybinds(Keyboard? newKeybind, int index) {
    setState(() {
      switch (index) {
        case 0:
          keys.stepUp = newKeybind;
        case 1:
          keys.stepDown = newKeybind;
      }
    });
    configuration.setF16Keys();
  }

  _setFlirKeybinds(Keyboard? newKeybind, int index) {
    setState(() {
      switch (index) {
        case 0:
          keys.flirUp = newKeybind;
        case 1:
          keys.flirDown = newKeybind;
      }
    });
    configuration.setF16Keys();
  }

  _setSwitchKeybinds(Keyboard? newKeybind, int index) {
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
    configuration.setF16Keys();
  }
}
