import 'package:app/api.dart';
import 'package:app/providers/providers.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';

class F16SelectorButton extends StatefulWidget {
  const F16SelectorButton({
    super.key,
    required this.sentValueUp,
    required this.sentValueDown,
    required this.labelUp,
    required this.labelDown,
  });

  final String sentValueUp;
  final String sentValueDown;
  final String labelUp;
  final String labelDown;

  @override
  State<F16SelectorButton> createState() => _F16SelectorButtonState();
}

class _F16SelectorButtonState extends State<F16SelectorButton> {
  bool isPressed = false;
  late Sounds provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<Sounds>();
    return AspectRatio(
      aspectRatio: 1 / 2, 
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
              onTapDown: (details) {
                _feedbackDown(widget.sentValueUp);
              },
              child: _button(widget.labelUp),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
              onTapDown: (details) {
                _feedbackDown(widget.sentValueDown);
              },
              child: _button(widget.labelDown),
            ),
          ),
        ],
      ),
    );
  }

  _button(String label) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(5),
        color: DefaultColors.f16KeypadInnerColor,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: constraints.maxHeight / 3,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }

  _feedbackDown(String value) {
    Vibrate.feedback(FeedbackType.heavy);
    provider.pool.play(provider.activeSound);
    sendInput(value);
  }
}
