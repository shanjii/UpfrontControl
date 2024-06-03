import 'package:icp_app/data/models/f16_keys_model.dart';
import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/ui/pages/f16/button_groups/f16_keypad.dart';
import 'package:icp_app/ui/pages/f16/button_groups/f16_left.dart';
import 'package:icp_app/ui/pages/f16/button_groups/f16_right.dart';
import 'package:icp_app/ui/pages/f16/button_groups/f16_top.dart';
import 'package:icp_app/providers/activity.dart';
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
    return F16Left(
      dobberUp: f16Keys.dobberUp,
      dobberLeft: f16Keys.dobberLeft,
      dobberDown: f16Keys.dobberDown,
      dobberRight: f16Keys.dobberRight,
      switchUp: f16Keys.stepUp,
      switchDown: f16Keys.stepDown,
    );
  }

  _centerGroup() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        F16Top(
          com1: f16Keys.com1,
          com2: f16Keys.com2,
          iff: f16Keys.iff,
          list: f16Keys.list,
          aa: f16Keys.aa,
          ag: f16Keys.ag,
        ),
        F16Keypad(
          num0: f16Keys.num0,
          num1: f16Keys.num1,
          num2: f16Keys.num2,
          num3: f16Keys.num3,
          num4: f16Keys.num4,
          num5: f16Keys.num5,
          num6: f16Keys.num6,
          num7: f16Keys.num7,
          num8: f16Keys.num8,
          num9: f16Keys.num9,
          entr: f16Keys.entr,
          rcl: f16Keys.rcl,
        ),
      ],
    );
  }

  _rightGroup() {
    return F16Right(
      switchUp: f16Keys.flirUp,
      switchDown: f16Keys.flirDown,
      drift: f16Keys.drift,
      norm: f16Keys.norm,
      warnReset: f16Keys.warnReset,
      wx: f16Keys.wx,
    );
  }
}
