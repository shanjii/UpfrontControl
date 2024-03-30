import 'package:app/pages/f16/layout/f16_keypad.dart';
import 'package:app/pages/f16/layout/f16_left.dart';
import 'package:app/pages/f16/layout/f16_right.dart';
import 'package:app/pages/f16/layout/f16_top.dart';
import 'package:app/providers/feedbacks.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16 extends StatelessWidget {
  const F16({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    context.read<Feedbacks>().initSoundF16();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: DefaultColors.backgroundOled,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.20),
            child: _left(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.6),
            child: _center(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.20),
            child: _right(),
          ),
        ],
      ),
    );
  }

  _left() {
    return const F16Left();
  }

  _center() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        F16Top(
          com1: "a",
          com2: "b",
          iff: "c",
          list: "d",
          ag: "e",
          aa: "f",
        ),
        F16Keypad(
          num0: "0",
          num1: "1",
          num2: "2",
          num3: "3",
          num4: "4",
          num5: "5",
          num6: "6",
          num7: "7",
          num8: "8",
          num9: "9",
          entr: "q",
          rcl: "w",
        ),
      ],
    );
  }

  _right() {
    return const F16Right();
  }
}
