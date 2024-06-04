import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/ui/pages/f16/layouts/buttons/f16_keypad_button.dart';
import 'package:icp_app/providers/tools.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Keypad extends StatelessWidget {
  const F16Keypad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var devMode = context.read<Tools>().devMode;
    var f16Keys = context.read<Communication>().f16keysModel;

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
                          sentValue: f16Keys.num1,
                        ),
                        F16KeypadButton(
                          topLabel: "ALOW",
                          label: "2",
                          cornerLabel: "N",
                          sentValue: f16Keys.num2,
                        ),
                        F16KeypadButton(
                          topLabel: "",
                          label: "3",
                          cornerLabel: "",
                          sentValue: f16Keys.num3,
                        ),
                        const SizedBox(width: 10),
                        F16KeypadButton(
                          label: "RCL",
                          functionButton: true,
                          sentValue: f16Keys.rcl,
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
                          sentValue: f16Keys.num4,
                        ),
                        F16KeypadButton(
                          topLabel: "CRUS",
                          label: "5",
                          cornerLabel: "",
                          sentValue: f16Keys.num5,
                        ),
                        F16KeypadButton(
                          topLabel: "TIME",
                          label: "6",
                          cornerLabel: "E",
                          sentValue: f16Keys.num6,
                        ),
                        const SizedBox(width: 10),
                        F16KeypadButton(
                          label: "ENTR",
                          functionButton: true,
                          sentValue: f16Keys.entr,
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
                          sentValue: f16Keys.num7,
                        ),
                        F16KeypadButton(
                          topLabel: "FIX",
                          label: "8",
                          cornerLabel: "S",
                          sentValue: f16Keys.num8,
                        ),
                        F16KeypadButton(
                          topLabel: "A-CAL",
                          label: "9",
                          cornerLabel: "",
                          sentValue: f16Keys.num9,
                        ),
                        F16KeypadButton(
                          topLabel: "M-SEL",
                          label: "0",
                          cornerLabel: "━",
                          sentValue: f16Keys.num0,
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
