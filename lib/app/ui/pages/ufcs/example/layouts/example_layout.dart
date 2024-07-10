import 'package:ufc_app/app/presenters/ufc_presenter.dart';
import 'package:flutter/material.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/buttons/f16_keypad_button.dart';

class ExampleLayout extends StatelessWidget {
  const ExampleLayout({
    super.key,
    required this.controller,
  });

  final UfcPresenter controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final devMode = controller.data.devMode;
    final f18Keys = controller.data.f18KeysValues;

    return Placeholder(
      color: devMode ? Colors.grey : Colors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height * 0.7),
        child: Align(
          alignment: Alignment.topCenter,
          child: AspectRatio(
            aspectRatio: 8 / 4,
            child: Placeholder(
              color: devMode ? Colors.red : Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        F16KeypadButton(
                          topLabel: "T-ILS",
                          label: "1",
                          cornerLabel: "",
                          sentValue: f18Keys.num1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
