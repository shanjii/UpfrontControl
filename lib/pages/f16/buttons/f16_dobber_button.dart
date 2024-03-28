import 'package:app/api.dart';
import 'package:app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';

class F16DobberButton extends StatefulWidget {
  const F16DobberButton({
    super.key,
  });

  @override
  State<F16DobberButton> createState() => _F16DobberButtonState();
}

class _F16DobberButtonState extends State<F16DobberButton> {
  bool isPressed = false;
  late Sounds provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<Sounds>();
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: Colors.red,
      ),
    );
  }

  _feedbackDown(String value) {
    Vibrate.feedback(FeedbackType.heavy);
    provider.pool.play(provider.activeSound);
    sendInput(value);
  }
}
