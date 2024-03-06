import 'package:app/api.dart';
import 'package:app/providers/audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';

class F16Keypad extends StatefulWidget {
  const F16Keypad({
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
  State<F16Keypad> createState() => _F16KeypadState();
}

class _F16KeypadState extends State<F16Keypad> {
  bool isPressed = false;
  late AudioProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<AudioProvider>();
    return Expanded(
      child: GestureDetector(
        onTapDown: (details) {
          _feedbackDown(widget.sentValue);
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 182, 182, 182),
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
        color: const Color.fromARGB(255, 236, 236, 236),
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
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  cornerLabel,
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
    Vibrate.feedback(FeedbackType.medium);
    provider.pool.play(provider.activeSound);
    sendInput(value);
  }
}
