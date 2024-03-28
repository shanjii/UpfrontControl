import 'package:app/api.dart';
import 'package:app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
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
  late Sounds provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<Sounds>();
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: GestureDetector(
          onTapDown: (details) {
            _feedbackDown(widget.sentValue);
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 77, 77, 77),
              border: _buttonBorder(),
              borderRadius: BorderRadius.circular(500),
            ),
            child: _labels(
              widget.label,
              widget.secondLabel,
            ),
          ),
        ),
      ),
    );
  }

  _buttonBorder() {
    return Border.all(
      color: const Color.fromARGB(255, 236, 236, 236),
      width: 3,
    );
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
                color: Colors.white,
                fontSize: constraints.maxHeight / 3,
                letterSpacing: 0,
                height: 1,
              ),
            ),
            if (widget.secondLabel != null)
              Text(
                secondLabel!,
                style: TextStyle(
                  color: Colors.white,
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

  _feedbackDown(String value) {
    Vibrate.feedback(FeedbackType.heavy);
    provider.pool.play(provider.activeSound);
    sendInput(value);
  }
}
