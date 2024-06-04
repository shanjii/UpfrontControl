import 'package:icp_app/data/models/f16_keys_model.dart';
import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/ui/pages/f16/layouts/f16_keypad.dart';
import 'package:icp_app/ui/pages/f16/layouts/f16_left.dart';
import 'package:icp_app/ui/pages/f16/layouts/f16_right.dart';
import 'package:icp_app/ui/pages/f16/layouts/f16_top.dart';
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
                  child: const F16Left(),
                ),
                SizedBox(
                  width: width * 0.60,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      F16Top(),
                      F16Keypad(),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.20,
                  child: const F16Right(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
