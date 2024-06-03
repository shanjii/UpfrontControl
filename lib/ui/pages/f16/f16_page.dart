import 'package:icp_app/data/models/f16_keys_model.dart';
import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/ui/pages/f16/button_groups/f16_keypad.dart';
import 'package:icp_app/ui/pages/f16/button_groups/f16_left.dart';
import 'package:icp_app/ui/pages/f16/button_groups/f16_right.dart';
import 'package:icp_app/ui/pages/f16/button_groups/f16_top.dart';
import 'package:icp_app/providers/activity.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Page extends StatefulWidget {
  const F16Page({super.key});

  @override
  State<F16Page> createState() => _F16State();
}

class _F16State extends State<F16Page> {
  late Activity activity;
  late F16KeysModel f16Keys;

  @override
  void dispose() {
    activity.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    activity = context.read<Activity>();
    f16Keys = context.read<Communication>().f16keysModel;

    return Listener(
      onPointerDown: (event) => activity.resetTimer(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: DefaultColors.backgroundBlack,
        body: IgnorePointer(
          ignoring: !activity.isActive,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: context.watch<Activity>().isActive ? 1 : 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.20,
                  child: _leftGroup(),
                ),
                SizedBox(
                  width: width * 0.60,
                  child: _centerGroup(),
                ),
                SizedBox(
                  width: width * 0.20,
                  child: _rightGroup(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _leftGroup() {
    return const F16Left(
      dobberUp: Keyboard.Up,
      dobberLeft: Keyboard.Left,
      dobberDown: Keyboard.Down,
      dobberRight: Keyboard.Right,
      switchUp: Keyboard.PageUp,
      switchDown: Keyboard.PageDown,
    );
  }

  _centerGroup() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        F16Top(
          com1: f16Keys.COM1,
          com2: Keyboard.D2,
          iff: Keyboard.D3,
          list: Keyboard.D4,
          aa: Keyboard.D5,
          ag: Keyboard.D6,
        ),
        const F16Keypad(
          num0: Keyboard.NumPad0,
          num1: Keyboard.NumPad1,
          num2: Keyboard.NumPad2,
          num3: Keyboard.NumPad3,
          num4: Keyboard.NumPad4,
          num5: Keyboard.NumPad5,
          num6: Keyboard.NumPad6,
          num7: Keyboard.NumPad7,
          num8: Keyboard.NumPad8,
          num9: Keyboard.NumPad9,
          entr: Keyboard.Enter,
          rcl: Keyboard.Backspace,
        ),
      ],
    );
  }

  _rightGroup() {
    return const F16Right(
      switchUp: Keyboard.Add,
      switchDown: Keyboard.Subtract,
      drift: Keyboard.J,
      norm: Keyboard.K,
      warnReset: Keyboard.L,
      wx: Keyboard.Multiply,
    );
  }
}
