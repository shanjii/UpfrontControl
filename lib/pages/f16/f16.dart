import 'package:app/pages/f16/layout/f16_keypad.dart';
import 'package:app/pages/f16/layout/f16_left.dart';
import 'package:app/pages/f16/layout/f16_right.dart';
import 'package:app/pages/f16/layout/f16_top.dart';
import 'package:app/providers/feedbacks.dart';
import 'package:app/values/buttons.dart';
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
      backgroundColor: DefaultColors.backgroundBlack,
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
    return const F16Left(
      dobberUp: Keyboard.Up,
      dobberLeft: Keyboard.Left,
      dobberDown: Keyboard.Down,
      dobberRight: Keyboard.Right,
      switchUp: Keyboard.A,
      switchDown: Keyboard.A,
    );
  }

  _center() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        F16Top(
          com1: Keyboard.A,
          com2: Keyboard.A,
          iff: Keyboard.A,
          list: Keyboard.A,
          aa: Keyboard.A,
          ag: Keyboard.A,
        ),
        F16Keypad(
          num0: Keyboard.A,
          num1: Keyboard.A,
          num2: Keyboard.A,
          num3: Keyboard.A,
          num4: Keyboard.A,
          num5: Keyboard.A,
          num6: Keyboard.A,
          num7: Keyboard.A,
          num8: Keyboard.A,
          num9: Keyboard.A,
          entr: Keyboard.A,
          rcl: Keyboard.A,
        ),
      ],
    );
  }

  _right() {
    return const F16Right(
      switchUp: Keyboard.A,
      switchDown: Keyboard.A,
      drift: Keyboard.A,
      norm: Keyboard.A,
      warnReset: Keyboard.A,
      wx: Keyboard.A,
    );
  }
}
