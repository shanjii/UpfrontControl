import 'package:icp_app/app/presenters/global_presenters/button_presenter.dart';
import 'package:icp_app/app/ui/pages/f16/buttons/f16_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Top extends StatelessWidget {
  const F16Top({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Consumer(
      builder: (context, ButtonPresenter controller, _) {
        var devMode = controller.data.devMode;
        var f16Keys = controller.data.f16KeysValues;

        return Placeholder(
          color: devMode ? Colors.grey : Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: height * 0.3),
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 19 / 4,
                child: Placeholder(
                  color: devMode ? Colors.red : Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: F16RoundedButton(
                          sentValue: f16Keys.com1,
                          label: "COM",
                          secondLabel: "1",
                        ),
                      ),
                      Expanded(
                        child: F16RoundedButton(
                          sentValue: f16Keys.com2,
                          label: "COM",
                          secondLabel: "2",
                        ),
                      ),
                      Expanded(
                        child: F16RoundedButton(
                          sentValue: f16Keys.iff,
                          label: "IFF",
                        ),
                      ),
                      Expanded(
                        child: F16RoundedButton(
                          sentValue: f16Keys.list,
                          label: "LIST",
                        ),
                      ),
                      Expanded(
                        child: F16RoundedButton(
                          sentValue: f16Keys.aa,
                          label: "A-A",
                        ),
                      ),
                      Expanded(
                        child: F16RoundedButton(
                          sentValue: f16Keys.ag,
                          label: "A-G",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
