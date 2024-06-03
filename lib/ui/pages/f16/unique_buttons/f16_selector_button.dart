import 'package:icp_app/ui/common/key_actions.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/values/colors.dart';
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

  final Keyboard? sentValueUp;
  final Keyboard? sentValueDown;
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
                  onPress(
                    widget.sentValueUp,
                    context.read<Feedbacks>(),
                    context.read<Communication>(),
                  );
                },
                onTapUp: (details) {
                  setState(() {
                    pressedUp = false;
                  });
                  onRelease(
                    widget.sentValueUp,
                    context.read<Feedbacks>(),
                    context.read<Communication>(),
                  );
                },
                onTapCancel: () {
                  setState(() {
                    pressedUp = false;
                  });
                  onRelease(
                    widget.sentValueUp,
                    context.read<Feedbacks>(),
                    context.read<Communication>(),
                  );
                },
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
                  onPress(
                    widget.sentValueDown,
                    context.read<Feedbacks>(),
                    context.read<Communication>(),
                  );
                },
                onTapUp: (details) {
                  setState(() {
                    pressedDown = false;
                  });
                  onRelease(
                    widget.sentValueDown,
                    context.read<Feedbacks>(),
                    context.read<Communication>(),
                  );
                },
                onTapCancel: () {
                  setState(() {
                    pressedDown = false;
                  });
                  onRelease(
                    widget.sentValueDown,
                    context.read<Feedbacks>(),
                    context.read<Communication>(),
                  );
                },
                child: _button(widget.labelDown, widget.sentValueDown),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _button(String label, Keyboard? sentValue) {
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
