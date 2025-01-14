import 'package:ufc_app/app/presentation/ui/pages/ufcs/ufc_provider.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/buttons/f16_rounded_solid_button.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/buttons/f16_selector_button.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/buttons/f16_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Right extends StatelessWidget {
  const F16Right({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Consumer(
      builder: (context, UfcProvider controller, _) {
        var devMode = controller.data.devMode;
        var f16Keys = controller.data.f16KeysValues;

        return Placeholder(
          color: devMode ? Colors.grey : Colors.transparent,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxHeight: height),
                child: Align(
                  alignment: Alignment.center,
                  child: Placeholder(
                    color: devMode ? Colors.red : Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.4,
                            maxHeight: height * 0.33,
                          ),
                          child: F16RoundedSolidButton(
                            sentValue: f16Keys.wx,
                            label: "WX",
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.45,
                            maxHeight: height * 0.33,
                          ),
                          child: F16SelectorButton(
                            labelUp: "▲",
                            labelDown: "▼",
                            sentValueUp: f16Keys.flirUp,
                            sentValueDown: f16Keys.flirDown,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: height * 0.33,
                            maxWidth: constraints.maxWidth * 0.8,
                          ),
                          child: F16Switch(
                            sentValueDrift: f16Keys.drift,
                            sentValueNorm: f16Keys.norm,
                            sentValueWrnRst: f16Keys.warnReset,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
