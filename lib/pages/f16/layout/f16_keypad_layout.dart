import 'package:app/pages/f16/buttons/f16_keypad.dart';
import 'package:flutter/material.dart';

class F16KeypadRegion extends StatelessWidget {
  const F16KeypadRegion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 6 / 4,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    F16Keypad(
                      topLabel: "T-ILS",
                      label: "1",
                      cornerLabel: "",
                      sentValue: "a",
                    ),
                    F16Keypad(
                      topLabel: "ALOW",
                      label: "2",
                      cornerLabel: "N",
                      sentValue: "b",
                    ),
                    F16Keypad(
                      topLabel: "",
                      label: "3",
                      cornerLabel: "",
                      sentValue: "c",
                    ),
                    SizedBox(width: 10),
                    F16Keypad(
                      label: "RCL",
                      functionButton: true,
                      sentValue: "d",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    F16Keypad(
                      topLabel: "STPT",
                      label: "4",
                      cornerLabel: "W",
                      sentValue: "e",
                    ),
                    F16Keypad(
                      topLabel: "CRUS",
                      label: "5",
                      cornerLabel: "",
                      sentValue: "f",
                    ),
                    F16Keypad(
                      topLabel: "TIME",
                      label: "6",
                      cornerLabel: "E",
                      sentValue: "g",
                    ),
                    SizedBox(width: 10),
                    F16Keypad(
                      label: "ENTR",
                      functionButton: true,
                      sentValue: "h",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    F16Keypad(
                      topLabel: "MARK",
                      label: "7",
                      cornerLabel: "",
                      sentValue: "i",
                    ),
                    F16Keypad(
                      topLabel: "FIX",
                      label: "8",
                      cornerLabel: "S",
                      sentValue: "j",
                    ),
                    F16Keypad(
                      topLabel: "A-CAL",
                      label: "9",
                      cornerLabel: "",
                      sentValue: "k",
                    ),
                    F16Keypad(
                      topLabel: "M-SEL",
                      label: "0",
                      cornerLabel: "-",
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
    );
  }
}


//  return Container(
//       color: Colors.red,
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               F16Keypad(
//                 topLabel: "T-ILS",
//                 label: "1",
//                 cornerLabel: "",
//                 sentValue: "a",
//               ),
//               F16Keypad(
//                 topLabel: "ALOW",
//                 label: "2",
//                 cornerLabel: "N",
//                 sentValue: "b",
//               ),
//               F16Keypad(
//                 topLabel: "",
//                 label: "3",
//                 cornerLabel: "",
//                 sentValue: "c",
//               ),
//               SizedBox(width: 10),
//               F16Keypad(
//                 label: "RCL",
//                 functionButton: true,
//                 sentValue: "d",
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               F16Keypad(
//                 topLabel: "STPT",
//                 label: "4",
//                 cornerLabel: "W",
//                 sentValue: "e",
//               ),
//               F16Keypad(
//                 topLabel: "CRUS",
//                 label: "5",
//                 cornerLabel: "",
//                 sentValue: "f",
//               ),
//               F16Keypad(
//                 topLabel: "TIME",
//                 label: "6",
//                 cornerLabel: "E",
//                 sentValue: "g",
//               ),
//               SizedBox(width: 10),
//               F16Keypad(
//                 label: "ENTR",
//                 functionButton: true,
//                 sentValue: "h",
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               F16Keypad(
//                 topLabel: "MARK",
//                 label: "7",
//                 cornerLabel: "",
//                 sentValue: "i",
//               ),
//               F16Keypad(
//                 topLabel: "FIX",
//                 label: "8",
//                 cornerLabel: "S",
//                 sentValue: "j",
//               ),
//               F16Keypad(
//                 topLabel: "A-CAL",
//                 label: "9",
//                 cornerLabel: "",
//                 sentValue: "k",
//               ),
//               F16Keypad(
//                 topLabel: "M-SEL",
//                 label: "0",
//                 cornerLabel: "-",
//                 sentValue: "k",
//               ),
//               SizedBox(width: 10),
//             ],
//           ),
//         ],
//       ),
//     );