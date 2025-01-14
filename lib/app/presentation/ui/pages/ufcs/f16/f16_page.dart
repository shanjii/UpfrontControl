import 'package:ufc_app/app/presentation/providers/activity_provider.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/ufc_provider.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/layouts/f16_keypad.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/layouts/f16_left.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/layouts/f16_right.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/layouts/f16_top.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Page extends StatelessWidget {
  const F16Page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Provider(
      create: (context) => UfcProvider(context),
      dispose: (context, value) => value.activity.stop(),
      child: Consumer<UfcProvider>(
        builder: (context, controller, _) {
          return Listener(
            onPointerDown: (event) => controller.activity.resetTimer(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: DefaultColors.black,
              body: IgnorePointer(
                ignoring: !controller.activity.isActive,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: context.watch<ActivityProvider>().isActive ? 1 : 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.20,
                        child: const F16Left(),
                      ),
                      SizedBox(
                        width: width * 0.60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const F16Top(),
                            F16Keypad(
                              controller: controller,
                            ),
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
