import 'package:icp_app/pages/f16/f16_actions.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/providers/network.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16RoundedSolidButton extends StatefulWidget {
  const F16RoundedSolidButton({
    super.key,
    required this.sentValue,
    required this.label,
    this.secondLabel,
  });

  final Keyboard sentValue;
  final String label;
  final String? secondLabel;

  @override
  State<F16RoundedSolidButton> createState() => _F16RoundedSolidButtonState();
}

class _F16RoundedSolidButtonState extends State<F16RoundedSolidButton> {
  bool isPressed = false;

  late F16Actions f16actions;

  @override
  Widget build(BuildContext context) {
    f16actions = F16Actions(
      feedbacks: context.read<Feedbacks>(),
      network: context.read<Network>(),
    );

    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPressed = true;
          });
          f16actions.onPress(widget.sentValue);
        },
        onTapUp: (details) {
          setState(() {
            isPressed = false;
          });
          f16actions.onRelease(widget.sentValue);
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
          f16actions.onRelease(widget.sentValue);
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: _buttonInnerColor(),
            borderRadius: BorderRadius.circular(500),
          ),
          child: _labels(
            widget.label,
            widget.secondLabel,
          ),
        ),
      ),
    );
  }

  _buttonInnerColor() {
    if (isPressed) {
      return DefaultColors.f16RoundButtonDepress;
    } else {
      return DefaultColors.f16RoundButton;
    }
  }

  _labels(String label, String? secondLabel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: DefaultColors.label,
                fontSize: constraints.maxHeight / 3,
                letterSpacing: 0,
                height: 1,
              ),
            ),
            if (widget.secondLabel != null)
              Text(
                secondLabel!,
                style: TextStyle(
                  color: DefaultColors.label,
                  fontSize: constraints.maxHeight / 3,
                  letterSpacing: 0,
                  height: 1,
                ),
              ),
          ],
        );
      },
    );
  }
}
