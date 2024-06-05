import 'package:icp_app/providers/activity.dart';
import 'package:icp_app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F18Page extends StatefulWidget {
  const F18Page({super.key});

  @override
  State<F18Page> createState() => _F18State();
}

class _F18State extends State<F18Page> {
  late Activity activity;

  @override
  void dispose() {
    activity.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    activity = context.read<Activity>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: DefaultColors.backgroundBlack,
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
