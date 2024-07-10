import 'package:provider/provider.dart';
import 'package:ufc_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:ufc_app/app/presenters/ufc_presenter.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f18/layouts/f18_keypad.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:flutter/material.dart';

class F18Page extends StatefulWidget {
  const F18Page({super.key});

  @override
  State<F18Page> createState() => _F18State();
}

class _F18State extends State<F18Page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Provider(
      create: (context) => UfcPresenter(context),
      dispose: (context, value) => value.activity.stop(),
      child: Consumer(
        builder: (context, UfcPresenter controller, _) {
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
                        width: width * 0.60,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            F18Keypad(),
                          ],
                        ),
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
