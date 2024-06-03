import 'package:icp_app/ui/common/key_actions.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/providers/communication.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16Switch extends StatefulWidget {
  final Keyboard? sentValueDrift;
  final Keyboard? sentValueNorm;
  final Keyboard? sentValueWrnRst;

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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DefaultColors.f16ButtonInner,
      child: Column(
        children: [
          _Button(
            title: "DRIFT C/O",
            color: DefaultColors.f16ButtonInner,
            onPress: () => onPress(
              widget.sentValueDrift,
              context.read<Feedbacks>(),
              context.read<Communication>(),
            ),
            onRelease: () => onRelease(
              widget.sentValueDrift,
              context.read<Feedbacks>(),
              context.read<Communication>(),
            ),
          ),
          _Button(
            title: "NORM",
            color: DefaultColors.f16ButtonInner,
            onPress: () => onPress(
              widget.sentValueNorm,
              context.read<Feedbacks>(),
              context.read<Communication>(),
            ),
            onRelease: () => onRelease(
              widget.sentValueNorm,
              context.read<Feedbacks>(),
              context.read<Communication>(),
            ),
          ),
          _Button(
            title: "WRN RST",
            color: DefaultColors.f16RoundButton,
            onPress: () => onPress(
              widget.sentValueWrnRst,
              context.read<Feedbacks>(),
              context.read<Communication>(),
            ),
            onRelease: () => onRelease(
              widget.sentValueWrnRst,
              context.read<Feedbacks>(),
              context.read<Communication>(),
            ),
          ),
        ],
      ),
    );
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
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            pressed = true;
          });
          widget.onPress();
        },
        onTapUp: (details) {
          setState(() {
            pressed = false;
          });
          widget.onRelease();
        },
        onTapCancel: () {
          setState(() {
            pressed = false;
          });
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
