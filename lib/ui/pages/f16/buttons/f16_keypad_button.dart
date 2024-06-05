import 'package:icp_app/common/key_actions.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/values/colors.dart';
import 'package:flutter/material.dart';

class F16KeypadButton extends StatefulWidget {
  const F16KeypadButton({
    super.key,
    this.sentValue,
    this.topLabel,
    required this.label,
    this.cornerLabel,
    this.functionButton = false,
  });

  final Keyboard? sentValue;
  final String? topLabel;
  final String label;
  final String? cornerLabel;
  final bool functionButton;

  @override
  State<F16KeypadButton> createState() => _F16KeypadState();
}

class _F16KeypadState extends State<F16KeypadButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPressed = true;
          });
          onPress(context, key: widget.sentValue);
        },
        onTapUp: (details) {
          setState(() {
            isPressed = false;
          });
          onRelease(context, key: widget.sentValue);
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
          onRelease(context, key: widget.sentValue);
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: _buttonInnerColor(),
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
        color: _buttonOuterColor(),
        width: 3,
      );
    }
  }

  _buttonInnerColor() {
    if (isPressed) {
      return DefaultColors.f16ButtonInnerDepress;
    } else {
      return DefaultColors.f16ButtonInner;
    }
  }

  _buttonOuterColor() {
    if (isPressed) {
      return DefaultColors.f16ButtonOuterDepress;
    } else {
      return DefaultColors.f16ButtonOuter;
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
                    color: DefaultColors.label,
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
                    color: DefaultColors.label,
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
                    color: DefaultColors.label,
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
                    color: DefaultColors.label,
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
}
