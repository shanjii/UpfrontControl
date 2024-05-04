import 'package:ICPApp/providers/feedbacks.dart';
import 'package:ICPApp/providers/network.dart';
import 'package:ICPApp/values/buttons.dart';
import 'package:ICPApp/values/colors.dart';
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

  _onPress(Keyboard value) {
    feedbacks.tapVibration();
    feedbacks.tapSound();
    network.sendInput(value);
  }
}
