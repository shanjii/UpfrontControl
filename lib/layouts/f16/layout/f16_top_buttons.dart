import 'package:app/layouts/f16/buttons/f16_rounded_button.dart';
import 'package:flutter/material.dart';

class F16TopButtons extends StatelessWidget {
  const F16TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            F16RoundedButton(
              sentValue: "z",
              label: "COM",
              secondLabel: "1",
            ),
            F16RoundedButton(
              sentValue: "z",
              label: "COM",
              secondLabel: "2",
            ),
            F16RoundedButton(
              sentValue: "z",
              label: "IFF",
            ),
            F16RoundedButton(
              sentValue: "z",
              label: "LIST",
            ),
            F16RoundedButton(
              sentValue: "z",
              label: "A-G",
            ),
            F16RoundedButton(
              sentValue: "z",
              label: "A-A",
            ),
          ],
        ),
      ),
    );
  }
}
