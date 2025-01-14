import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/ufc_provider.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16SelectorButton extends StatefulWidget {
  const F16SelectorButton({
    super.key,
    this.sentValueUp,
    this.sentValueDown,
    required this.labelUp,
    required this.labelDown,
  });

  final ActionModel? sentValueUp;
  final ActionModel? sentValueDown;
  final String labelUp;
  final String labelDown;

  @override
  State<F16SelectorButton> createState() => _F16SelectorButtonState();
}

class _F16SelectorButtonState extends State<F16SelectorButton> {
  bool pressedUp = false;
  bool pressedDown = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UfcProvider controller, _) {
        return AspectRatio(
          aspectRatio: 1 / 2,
          child: Container(
            decoration: _buttonDecoration(),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Listener(
                    onPointerDown: (details) {
                      setState(() => pressedUp = true);
                      if (widget.sentValueUp == null) return;
                      controller.onPress(widget.sentValueUp!);
                    },
                    onPointerUp: (details) {
                      setState(() => pressedUp = false);
                      if (widget.sentValueUp == null) return;
                      controller.onRelease(widget.sentValueUp!);
                    },
                    onPointerCancel: (details) {
                      setState(() => pressedUp = false);
                      if (widget.sentValueUp == null) return;
                      controller.onRelease(widget.sentValueUp!);
                    },
                    child: _button(widget.labelUp),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1,
                  child: Listener(
                    onPointerDown: (details) {
                      setState(() => pressedDown = true);
                      if (widget.sentValueDown == null) return;
                      controller.onPress(widget.sentValueDown!);
                    },
                    onPointerUp: (details) {
                      setState(() => pressedDown = false);
                      if (widget.sentValueDown == null) return;
                      controller.onRelease(widget.sentValueDown!);
                    },
                    onPointerCancel: (details) {
                      setState(() => pressedDown = false);
                      if (widget.sentValueDown == null) return;
                      controller.onRelease(widget.sentValueDown!);
                    },
                    child: _button(widget.labelDown),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _button(String label) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(5),
        color: Colors.transparent,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: constraints.maxHeight / 3,
              color: DefaultColors.label,
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
        DefaultColors.f16ButtonInnerDepress,
        DefaultColors.f16ButtonInner,
        DefaultColors.f16ButtonInnerElevated,
      ];
    } else if (pressedDown) {
      return [
        DefaultColors.f16ButtonInnerElevated,
        DefaultColors.f16ButtonInner,
        DefaultColors.f16ButtonInnerDepress,
      ];
    } else {
      return [
        DefaultColors.f16ButtonInner,
        DefaultColors.f16ButtonInner,
      ];
    }
  }
}
