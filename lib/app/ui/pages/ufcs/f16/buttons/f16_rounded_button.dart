import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/presenters/ufc_presenter.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16RoundedButton extends StatefulWidget {
  const F16RoundedButton({
    super.key,
    this.sentValue,
    required this.label,
    this.secondLabel,
  });

  final ActionModel? sentValue;
  final String label;
  final String? secondLabel;

  @override
  State<F16RoundedButton> createState() => _F16RoundedButtonState();
}

class _F16RoundedButtonState extends State<F16RoundedButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UfcPresenter controller, _) {
        return AspectRatio(
          aspectRatio: 1,
          child: Listener(
            onPointerDown: (details) {
              setState(() => isPressed = true);
              if (widget.sentValue == null) return;
              controller.onPress(widget.sentValue!);
            },
            onPointerUp: (details) {
              setState(() => isPressed = false);
              if (widget.sentValue == null) return;
              controller.onRelease(widget.sentValue!);
            },
            onPointerCancel: (details) {
              setState(() => isPressed = false);
              if (widget.sentValue == null) return;
              controller.onRelease(widget.sentValue!);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: _buttonInnerColor(),
                border: _buttonBorder(),
                borderRadius: BorderRadius.circular(500),
              ),
              child: _labels(
                widget.label,
                widget.secondLabel,
              ),
            ),
          ),
        );
      },
    );
  }

  _buttonBorder() {
    return Border.all(
      color: _buttonOuterColor(),
      width: 3,
    );
  }

  _buttonInnerColor() {
    if (isPressed) {
      return DefaultColors.f16RoundButtonDepress;
    } else {
      return DefaultColors.f16RoundButton;
    }
  }

  _buttonOuterColor() {
    if (isPressed) {
      return DefaultColors.f16RoundButtonOuterDepress;
    } else {
      return DefaultColors.f16RoundButtonOuter;
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
}
