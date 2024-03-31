import 'package:app/providers/feedbacks.dart';
import 'package:app/providers/network.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Switch extends StatefulWidget {
  final String sentValueDrift;
  final String sentValueNorm;
  final String sentValueWrnRst;

  const F16Switch({
    super.key,
    required this.sentValueDrift,
    required this.sentValueNorm,
    required this.sentValueWrnRst,
  });

  @override
  State<F16Switch> createState() => _F16SwitchState();
}

class _F16SwitchState extends State<F16Switch> {
  late Feedbacks feedbacks;
  late Network network;

  @override
  Widget build(BuildContext context) {
    feedbacks = context.read<Feedbacks>();
    network = context.read<Network>();

    return Container(
      color: DefaultColors.f16KeypadInnerColor,
      child: Column(
        children: [
          _Button(
            title: "DRIFT C/O",
            onPress: () => _onPress(widget.sentValueDrift),
          ),
          _Button(
            title: "NORM",
            onPress: () => _onPress(widget.sentValueNorm),
          ),
          _Button(
            title: "WRN RST",
            onPress: () => _onPress(widget.sentValueWrnRst),
          ),
        ],
      ),
    );
  }

  _onPress(String value) {
    feedbacks.tapVibration();
    feedbacks.tapSound();
    network.sendInput(value);
  }
}

class _Button extends StatefulWidget {
  final String title;
  final Function() onPress;

  const _Button({required this.title, required this.onPress});

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            pressed = true;
          });
          widget.onPress();
        },
        onTapUp: (details) => setState(() {
          pressed = false;
        }),
        onTapCancel: () => setState(() {
          pressed = false;
        }),
        child: Container(
          color: pressed
              ? DefaultColors.f16KeypadInnerDepressedColor
              : DefaultColors.f16KeypadInnerColor,
          child: _buttonLabel(widget.title),
        ),
      ),
    );
  }

  _buttonLabel(String title) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: constraints.maxHeight / 3.5,
            ),
          ),
        );
      },
    );
  }
}
