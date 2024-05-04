import 'package:icp_app/pages/f16/unique_buttons/f16_rounded_solid_button.dart';
import 'package:icp_app/pages/f16/unique_buttons/f16_selector_button.dart';
import 'package:icp_app/pages/f16/unique_buttons/f16_switch.dart';
import 'package:icp_app/providers/tools.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Right extends StatelessWidget {
  final Keyboard switchUp;
  final Keyboard switchDown;
  final Keyboard drift;
  final Keyboard norm;
  final Keyboard warnReset;
  final Keyboard wx;

  const F16Right({
    super.key,
    required this.switchUp,
    required this.switchDown,
    required this.drift,
    required this.norm,
    required this.warnReset,
    required this.wx,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var devMode = context.read<Tools>().devMode;

    return Placeholder(
      color: devMode ? Colors.grey : Colors.transparent,
      child: LayoutBuilder(builder: (context, constraints) {
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
                      sentValue: wx,
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
                      sentValueUp: switchUp,
                      sentValueDown: switchDown,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: height * 0.33,
                      maxWidth: constraints.maxWidth * 0.8,
                    ),
                    child: F16Switch(
                      sentValueDrift: drift,
                      sentValueNorm: norm,
                      sentValueWrnRst: warnReset,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
