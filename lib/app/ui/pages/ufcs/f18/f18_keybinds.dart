import 'package:flutter/material.dart';
import 'package:ufc_app/app/data/models/payloads/f16_keys_model.dart';
import 'package:ufc_app/app/presenters/global_presenters/button_presenter.dart';
import 'package:ufc_app/app/ui/components/keybinder.dart';
import 'package:ufc_app/app/ui/components/multi_keybinder.dart';
import 'package:ufc_app/app/ui/components/text.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_rounded_button.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_selector_button.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:provider/provider.dart';

class F18KeybindsPage extends StatefulWidget {
  const F18KeybindsPage({super.key});

  @override
  State<F18KeybindsPage> createState() => _F18KeybindsPage();
}

class _F18KeybindsPage extends State<F18KeybindsPage> {
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
                "F18 Keybinds",
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
                            controller.setExampleKeys();
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
                              _setMultiKeybindsExample(
                                key,
                                modifier,
                                index,
                                keys,
                              );
                              controller.setExampleKeys();
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

  _setMultiKeybindsExample(
    String? key,
    String? modifier,
    int index,
    F16KeysModel keys,
  ) {
    setState(() {
      switch (index) {
        case 0:
        // keys.example1.key = key;
        case 1:
        // keys.example2.key = key;
      }
    });
  }
}
