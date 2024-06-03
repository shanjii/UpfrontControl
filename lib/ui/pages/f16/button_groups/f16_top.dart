import 'package:icp_app/ui/pages/f16/unique_buttons/f16_rounded_button.dart';
import 'package:icp_app/providers/tools.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Top extends StatelessWidget {
  final Keyboard? com1;
  final Keyboard? com2;
  final Keyboard? iff;
  final Keyboard? list;
  final Keyboard? aa;
  final Keyboard? ag;
  const F16Top({
    super.key,
    required this.com1,
    required this.com2,
    required this.iff,
    required this.list,
    required this.ag,
    required this.aa,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var devMode = context.read<Tools>().devMode;

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
                      sentValue: com1,
                      label: "COM",
                      secondLabel: "1",
                    ),
                  ),
                  Expanded(
                    child: F16RoundedButton(
                      sentValue: com2,
                      label: "COM",
                      secondLabel: "2",
                    ),
                  ),
                  Expanded(
                    child: F16RoundedButton(
                      sentValue: iff,
                      label: "IFF",
                    ),
                  ),
                  Expanded(
                    child: F16RoundedButton(
                      sentValue: list,
                      label: "LIST",
                    ),
                  ),
                  Expanded(
                    child: F16RoundedButton(
                      sentValue: aa,
                      label: "A-A",
                    ),
                  ),
                  Expanded(
                    child: F16RoundedButton(
                      sentValue: ag,
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
  }
}
