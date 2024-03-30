import 'package:app/providers/network.dart';
import 'package:app/providers/feedbacks.dart';
import 'package:flutter/material.dart';
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
  late Feedbacks feedbacks;
  late Network network;

  @override
  Widget build(BuildContext context) {
    feedbacks = context.read<Feedbacks>();
    network = context.read<Network>();

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: Colors.red,
      ),
    );
  }

  _onPress(String value) {
    feedbacks.tapVibration();
    feedbacks.tapSound();
    network.sendInput(value);
  }
}
