import 'package:app/providers/feedbacks.dart';
import 'package:app/providers/network.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
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
  late Feedbacks feedbacks;
  late Network network;
  bool pressedUp = false;
  bool pressedDown = false;

  @override
  Widget build(BuildContext context) {
    feedbacks = context.read<Feedbacks>();
    network = context.read<Network>();

    return AspectRatio(
      aspectRatio: 1 / 2,
      child: Container(
        decoration: _buttonDecoration(),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    pressedUp = true;
                  });
                  _onPress(widget.sentValueUp);
                },
                onTapUp: (details) => setState(() {
                  pressedUp = false;
                }),
                onTapCancel: () => setState(() {
                  pressedUp = false;
                }),
                child: _button(widget.labelUp, widget.sentValueUp),
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    pressedDown = true;
                  });
                  _onPress(widget.sentValueDown);
                },
                onTapUp: (details) => setState(() {
                  pressedDown = false;
                }),
                onTapCancel: () => setState(() {
                  pressedDown = false;
                }),
                child: _button(widget.labelDown, widget.sentValueDown),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _button(String label, String sentValue) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(5),
        color: Colors.transparent,
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

  _buttonDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: _setGradientType(),
      ),
    );
  }

  _setGradientType() {
    if (pressedUp) {
      return [
        DefaultColors.f16KeypadInnerDepressedColor,
        DefaultColors.f16KeypadInnerElevatedColor,
      ];
    } else if (pressedDown) {
      return [
        DefaultColors.f16KeypadInnerElevatedColor,
        DefaultColors.f16KeypadInnerDepressedColor,
      ];
    } else {
      return [
        DefaultColors.f16KeypadInnerColor,
        DefaultColors.f16KeypadInnerColor
      ];
    }
  }

  _onPress(String value) {
    feedbacks.tapVibration();
    feedbacks.tapSound();
    network.sendInput(value);
  }

  _onRelease(bool pressed) {
    setState(() {
      pressedUp = false;
    });
  }
}
