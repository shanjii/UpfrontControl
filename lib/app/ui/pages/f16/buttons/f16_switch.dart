import 'package:icp_app/app/presenters/f16_presenter.dart';
import 'package:icp_app/core/values/buttons.dart';
import 'package:icp_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Switch extends StatefulWidget {
  final Keyboard? sentValueDrift;
  final Keyboard? sentValueNorm;
  final Keyboard? sentValueWrnRst;

  const F16Switch({
    super.key,
    this.sentValueDrift,
    this.sentValueNorm,
    this.sentValueWrnRst,
  });

  @override
  State<F16Switch> createState() => _F16SwitchState();
}

class _F16SwitchState extends State<F16Switch> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, F16Presenter controller, _) {
      return Container(
        color: DefaultColors.f16ButtonInner,
        child: Column(
          children: [
            _Button(
              title: "DRIFT C/O",
              color: DefaultColors.f16ButtonInner,
              onPress: () => controller.onPress(widget.sentValueDrift),
              onRelease: () => controller.onRelease(widget.sentValueDrift),
            ),
            _Button(
              title: "NORM",
              color: DefaultColors.f16ButtonInner,
              onPress: () => controller.onPress(widget.sentValueNorm),
              onRelease: () => controller.onRelease(widget.sentValueNorm),
            ),
            _Button(
              title: "WRN RST",
              color: DefaultColors.f16RoundButton,
              onPress: () => controller.onPress(widget.sentValueWrnRst),
              onRelease: () => controller.onRelease(widget.sentValueWrnRst),
            ),
          ],
        ),
      );
    });
  }
}

class _Button extends StatefulWidget {
  final String title;
  final Color color;
  final Function() onPress;
  final Function() onRelease;

  const _Button({
    required this.title,
    required this.onPress,
    required this.onRelease,
    required this.color,
  });

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Listener(
        onPointerDown: (details) {
          setState(() => pressed = true);
          widget.onPress();
        },
        onPointerUp: (details) {
          setState(() => pressed = false);
          widget.onRelease();
        },
        onPointerCancel: (details) {
          setState(() => pressed = false);
          widget.onRelease();
        },
        child: Container(
          color: pressed ? DefaultColors.f16ButtonInnerDepress : widget.color,
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
              color: DefaultColors.label,
              fontSize: constraints.maxHeight / 3,
            ),
          ),
        );
      },
    );
  }
}