import 'package:icp_app/pages/f16/unique_buttons/f16_dobber_button.dart';
import 'package:icp_app/pages/f16/unique_buttons/f16_selector_button.dart';
import 'package:icp_app/providers/tools.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Left extends StatelessWidget {
  final Keyboard switchUp;
  final Keyboard switchDown;
  final Keyboard dobberUp;
  final Keyboard dobberLeft;
  final Keyboard dobberDown;
  final Keyboard dobberRight;

  const F16Left({
    super.key,
    required this.switchUp,
    required this.switchDown,
    required this.dobberUp,
    required this.dobberLeft,
    required this.dobberDown,
    required this.dobberRight,
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
                      maxHeight: height * 0.40,
                      maxWidth: constraints.maxWidth,
                    ),
                    child: F16DobberButton(
                      sentValueUp: dobberUp,
                      sentValueDown: dobberDown,
                      sentValueLeft: dobberLeft,
                      sentValueRight: dobberRight,
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
