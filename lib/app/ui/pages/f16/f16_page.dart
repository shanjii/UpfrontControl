import 'package:icp_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/button_presenter.dart';
import 'package:icp_app/app/ui/pages/f16/layouts/f16_keypad.dart';
import 'package:icp_app/app/ui/pages/f16/layouts/f16_left.dart';
import 'package:icp_app/app/ui/pages/f16/layouts/f16_right.dart';
import 'package:icp_app/app/ui/pages/f16/layouts/f16_top.dart';
import 'package:icp_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Page extends StatelessWidget {
  const F16Page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Provider(
      create: (context) => ButtonPresenter(context),
      dispose: (context, value) => value.activity.stop(),
      child: Consumer(
        builder: (context, ButtonPresenter controller, _) {
          return Listener(
            onPointerDown: (event) => controller.activity.resetTimer(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: DefaultColors.black,
              body: IgnorePointer(
                ignoring: !controller.activity.isActive,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: context.watch<ActivityPresenter>().isActive ? 1 : 0,
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
        },
      ),
    );
  }
}
