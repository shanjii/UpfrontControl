import 'package:app/pages/f16/buttons/f16_rounded_button.dart';
import 'package:flutter/material.dart';

class F16Top extends StatelessWidget {
  final String com1;
  final String com2;
  final String iff;
  final String list;
  final String ag;
  final String aa;
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

    return Placeholder(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height * 0.3),
        child: Align(
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 19 / 4,
            child: Placeholder(
              color: Colors.red,
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
                      sentValue: ag,
                      label: "A-G",
                    ),
                  ),
                  Expanded(
                    child: F16RoundedButton(
                      sentValue: aa,
                      label: "A-A",
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
