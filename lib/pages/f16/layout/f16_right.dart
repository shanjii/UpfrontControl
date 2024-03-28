import 'package:app/pages/f16/buttons/f16_dobber_button.dart';
import 'package:app/pages/f16/buttons/f16_rounded_button.dart';
import 'package:app/pages/f16/buttons/f16_selector_button.dart';
import 'package:flutter/material.dart';

class F16Right extends StatelessWidget {
  const F16Right({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height),
        child: Align(
          alignment: Alignment.center,
          child: Placeholder(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * 0.45,
                    maxHeight: height * 0.33,
                  ),
                  child: const F16RoundedButton(sentValue: "a", label: "WX"),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth * 0.45,
                      maxHeight: height * 0.33),
                  child: const F16SelectorButton(
                    labelUp: "▲",
                    labelDown: "▼",
                    sentValueUp: "a",
                    sentValueDown: "b",
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: height * 0.33,
                    maxWidth: constraints.maxWidth,
                  ),
                  child: const F16DobberButton(),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
