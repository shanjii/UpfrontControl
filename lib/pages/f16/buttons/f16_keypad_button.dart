import 'package:app/api.dart';
import 'package:app/providers/providers.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';

class F16KeypadButton extends StatefulWidget {
  const F16KeypadButton({
    super.key,
    required this.sentValue,
    this.topLabel,
    required this.label,
    this.cornerLabel,
    this.functionButton = false,
  });

  final String sentValue;
  final String? topLabel;
  final String label;
  final String? cornerLabel;
  final bool functionButton;

  @override
  State<F16KeypadButton> createState() => _F16KeypadState();
}

class _F16KeypadState extends State<F16KeypadButton> {
  bool isPressed = false;
  late Sounds provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<Sounds>();
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTapDown: (details) {
          _feedbackDown(widget.sentValue);
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: DefaultColors.f16KeypadInnerColor,
            border: _buttonBorder(),
            borderRadius: BorderRadius.circular(5),
          ),
          child: _labels(widget.topLabel, widget.label, widget.cornerLabel),
        ),
      ),
    );
  }

  _buttonBorder() {
    if (widget.functionButton) {
      return null;
    } else {
      return Border.all(
        color: DefaultColors.f16KeypadOuterColor,
        width: 3,
      );
    }
  }

  _labels(String? topLabel, String label, String? cornerLabel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            if (topLabel != null)
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  topLabel,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxHeight / 3,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              ),
            if (widget.functionButton)
              Align(
                alignment: Alignment.center,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxHeight / 3,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              )
            else
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxHeight / 2,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              ),
            if (cornerLabel != null)
              Positioned(
                bottom: 0,
                right: 1,
                child: Text(
                  cornerLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxHeight / 3.5,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              )
          ],
        );
      },
    );
  }

  _feedbackDown(String value) {
    Vibrate.feedback(FeedbackType.heavy);
    provider.pool.play(provider.activeSound);
    sendInput(value);
  }
}
