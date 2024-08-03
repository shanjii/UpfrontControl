import 'package:ufc_app/app/presentation/ui/pages/ufcs/ufc_provider.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/buttons/f16_dobber_button.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/buttons/f16_selector_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Left extends StatelessWidget {
  const F16Left({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Consumer(
      builder: (context, UfcProvider controller, _) {
        var devMode = controller.data.devMode;
        var f16Keys = controller.data.f16KeysValues;

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
                          sentValueUp: f16Keys.stepUp,
                          sentValueDown: f16Keys.stepDown,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: height * 0.40,
                          maxWidth: constraints.maxWidth,
                        ),
                        child: F16DobberButton(
                          sentValueUp: f16Keys.dobberUp,
                          sentValueDown: f16Keys.dobberDown,
                          sentValueLeft: f16Keys.dobberLeft,
                          sentValueRight: f16Keys.dobberRight,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
