import 'package:app/pages/f16/buttons/f16_keypad_button.dart';
import 'package:flutter/material.dart';

class F16Keypad extends StatelessWidget {
  const F16Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height * 0.7),
      child: const Align(
        alignment: Alignment.topCenter,
        child: AspectRatio(
          aspectRatio: 8 / 4,
          child: Placeholder(
            color: Colors.red,
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
                        sentValue: "a",
                      ),
                      F16KeypadButton(
                        topLabel: "ALOW",
                        label: "2",
                        cornerLabel: "N",
                        sentValue: "b",
                      ),
                      F16KeypadButton(
                        topLabel: "",
                        label: "3",
                        cornerLabel: "",
                        sentValue: "c",
                      ),
                      SizedBox(width: 10),
                      F16KeypadButton(
                        label: "RCL",
                        functionButton: true,
                        sentValue: "d",
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
                        sentValue: "e",
                      ),
                      F16KeypadButton(
                        topLabel: "CRUS",
                        label: "5",
                        cornerLabel: "",
                        sentValue: "f",
                      ),
                      F16KeypadButton(
                        topLabel: "TIME",
                        label: "6",
                        cornerLabel: "E",
                        sentValue: "g",
                      ),
                      SizedBox(width: 10),
                      F16KeypadButton(
                        label: "ENTR",
                        functionButton: true,
                        sentValue: "h",
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
                        sentValue: "i",
                      ),
                      F16KeypadButton(
                        topLabel: "FIX",
                        label: "8",
                        cornerLabel: "S",
                        sentValue: "j",
                      ),
                      F16KeypadButton(
                        topLabel: "A-CAL",
                        label: "9",
                        cornerLabel: "",
                        sentValue: "k",
                      ),
                      F16KeypadButton(
                        topLabel: "M-SEL",
                        label: "0",
                        cornerLabel: "━",
                        sentValue: "k",
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
