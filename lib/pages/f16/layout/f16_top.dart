import 'package:app/pages/f16/buttons/f16_rounded_button.dart';
import 'package:flutter/material.dart';

class F16Top extends StatelessWidget {
  const F16Top({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height * 0.3),
      child: const Align(
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
                    sentValue: "z",
                    label: "COM",
                    secondLabel: "1",
                  ),
                ),
                Expanded(
                  child: F16RoundedButton(
                    sentValue: "z",
                    label: "COM",
                    secondLabel: "2",
                  ),
                ),
                Expanded(
                  child: F16RoundedButton(
                    sentValue: "z",
                    label: "IFF",
                  ),
                ),
                Expanded(
                  child: F16RoundedButton(
                    sentValue: "z",
                    label: "LIST",
                  ),
                ),
                Expanded(
                  child: F16RoundedButton(
                    sentValue: "z",
                    label: "A-G",
                  ),
                ),
                Expanded(
                  child: F16RoundedButton(
                    sentValue: "z",
                    label: "A-A",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
