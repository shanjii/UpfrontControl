import 'package:icp_app/pages/f16/unique_buttons/f16_keypad_button.dart';
import 'package:icp_app/providers/tools.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Keypad extends StatelessWidget {
  final Keyboard num1;
  final Keyboard num2;
  final Keyboard num3;
  final Keyboard num4;
  final Keyboard num5;
  final Keyboard num6;
  final Keyboard num7;
  final Keyboard num8;
  final Keyboard num9;
  final Keyboard num0;
  final Keyboard rcl;
  final Keyboard entr;

  const F16Keypad({
    super.key,
    required this.num1,
    required this.num2,
    required this.num3,
    required this.num4,
    required this.num5,
    required this.num6,
    required this.num7,
    required this.num8,
    required this.num9,
    required this.num0,
    required this.rcl,
    required this.entr,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var devMode = context.read<Tools>().devMode;

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
                          sentValue: num1,
                        ),
                        F16KeypadButton(
                          topLabel: "ALOW",
                          label: "2",
                          cornerLabel: "N",
                          sentValue: num2,
                        ),
                        F16KeypadButton(
                          topLabel: "",
                          label: "3",
                          cornerLabel: "",
                          sentValue: num3,
                        ),
                        const SizedBox(width: 10),
                        F16KeypadButton(
                          label: "RCL",
                          functionButton: true,
                          sentValue: rcl,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        F16KeypadButton(
                          topLabel: "STPT",
                          label: "4",
                          cornerLabel: "W",
                          sentValue: num4,
                        ),
                        F16KeypadButton(
                          topLabel: "CRUS",
                          label: "5",
                          cornerLabel: "",
                          sentValue: num5,
                        ),
                        F16KeypadButton(
                          topLabel: "TIME",
                          label: "6",
                          cornerLabel: "E",
                          sentValue: num6,
                        ),
                        const SizedBox(width: 10),
                        F16KeypadButton(
                          label: "ENTR",
                          functionButton: true,
                          sentValue: entr,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        F16KeypadButton(
                          topLabel: "MARK",
                          label: "7",
                          cornerLabel: "",
                          sentValue: num7,
                        ),
                        F16KeypadButton(
                          topLabel: "FIX",
                          label: "8",
                          cornerLabel: "S",
                          sentValue: num8,
                        ),
                        F16KeypadButton(
                          topLabel: "A-CAL",
                          label: "9",
                          cornerLabel: "",
                          sentValue: num9,
                        ),
                        F16KeypadButton(
                          topLabel: "M-SEL",
                          label: "0",
                          cornerLabel: "━",
                          sentValue: num0,
                        ),
                        const SizedBox(width: 10),
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