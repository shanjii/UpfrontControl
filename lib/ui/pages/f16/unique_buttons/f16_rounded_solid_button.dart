import 'package:icp_app/ui/common/key_actions.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/providers/communication.dart';
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

  final Keyboard? sentValue;
  final String label;
  final String? secondLabel;

  @override
  State<F16RoundedSolidButton> createState() => _F16RoundedSolidButtonState();
}

class _F16RoundedSolidButtonState extends State<F16RoundedSolidButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPressed = true;
          });
          onPress(
            widget.sentValue,
            context.read<Feedbacks>(),
            context.read<Communication>(),
          );
        },
        onTapUp: (details) {
          setState(() {
            isPressed = false;
          });
          onRelease(
            widget.sentValue,
            context.read<Feedbacks>(),
            context.read<Communication>(),
          );
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
          onRelease(
            widget.sentValue,
            context.read<Feedbacks>(),
            context.read<Communication>(),
          );
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
