import 'package:app/providers/feedbacks.dart';
import 'package:app/providers/network.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16RoundedButton extends StatefulWidget {
  const F16RoundedButton({
    super.key,
    required this.sentValue,
    required this.label,
    this.secondLabel,
  });

  final String sentValue;
  final String label;
  final String? secondLabel;

  @override
  State<F16RoundedButton> createState() => _F16RoundedButtonState();
}

class _F16RoundedButtonState extends State<F16RoundedButton> {
  bool isPressed = false;
  late Feedbacks feedbacks;
  late Network network;

  @override
  Widget build(BuildContext context) {
    feedbacks = context.read<Feedbacks>();
    network = context.read<Network>();

    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPressed = true;
          });
          _onPress(widget.sentValue);
        },
        onTapUp: (details) => setState(() {
          isPressed = false;
        }),
        onTapCancel: () => setState(() {
          isPressed = false;
        }),
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

  _onPress(String value) {
    feedbacks.tapVibration();
    feedbacks.tapSound();
    network.sendInput(value);
  }
}
