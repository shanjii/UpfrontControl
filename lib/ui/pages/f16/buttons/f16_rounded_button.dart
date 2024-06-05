import 'package:icp_app/common/key_actions.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/values/colors.dart';
import 'package:flutter/material.dart';

class F16RoundedButton extends StatefulWidget {
  const F16RoundedButton({
    super.key,
    this.sentValue,
    required this.label,
    this.secondLabel,
  });

  final Keyboard? sentValue;
  final String label;
  final String? secondLabel;

  @override
  State<F16RoundedButton> createState() => _F16RoundedButtonState();
}

class _F16RoundedButtonState extends State<F16RoundedButton> {
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
          onPress(context, key: widget.sentValue);
        },
        onTapUp: (details) {
          setState(() {
            isPressed = false;
          });
          onRelease(context, key: widget.sentValue);
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
          onRelease(context, key: widget.sentValue);
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: _buttonInnerColor(),
            border: _buttonBorder(),
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

  _buttonBorder() {
    return Border.all(
      color: _buttonOuterColor(),
      width: 3,
    );
  }

  _buttonInnerColor() {
    if (isPressed) {
      return DefaultColors.f16RoundButtonDepress;
    } else {
      return DefaultColors.f16RoundButton;
    }
  }

  _buttonOuterColor() {
    if (isPressed) {
      return DefaultColors.f16RoundButtonOuterDepress;
    } else {
      return DefaultColors.f16RoundButtonOuter;
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
