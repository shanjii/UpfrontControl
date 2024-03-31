import 'package:app/pages/f16/buttons/f16_rounded_solid_button%20copy.dart';
import 'package:app/pages/f16/buttons/f16_selector_button.dart';
import 'package:app/pages/f16/buttons/f16_switch.dart';
import 'package:app/providers/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Right extends StatelessWidget {
  final String switchUp;
  final String switchDown;
  final String drift;
  final String norm;
  final String warnReset;

  const F16Right({
    super.key,
    required this.switchUp,
    required this.switchDown,
    required this.drift,
    required this.norm,
    required this.warnReset,
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
                    child: const F16RoundedSolidButton(
                      sentValue: "a",
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
