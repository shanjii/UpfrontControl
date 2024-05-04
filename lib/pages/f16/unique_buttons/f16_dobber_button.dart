import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/providers/network.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16DobberButton extends StatefulWidget {
  final Keyboard sentValueUp;
  final Keyboard sentValueLeft;
  final Keyboard sentValueDown;
  final Keyboard sentValueRight;

  const F16DobberButton({
    super.key,
    required this.sentValueUp,
    required this.sentValueLeft,
    required this.sentValueDown,
    required this.sentValueRight,
  });

  @override
  State<F16DobberButton> createState() => _F16DobberButtonState();
}

enum _PressedButton {
  top,
  left,
  right,
  bottom,
  none,
}

class _F16DobberButtonState extends State<F16DobberButton> {
  _PressedButton pressedButton = _PressedButton.none;

  late Feedbacks feedbacks;
  late Network network;

  @override
  Widget build(BuildContext context) {
    feedbacks = context.read<Feedbacks>();
    network = context.read<Network>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTapDown: (details) => _getTapLocation(
            constraints: constraints,
            details: details,
            topPress: () => _onPress(widget.sentValueUp),
            rightPress: () => _onPress(widget.sentValueRight),
            leftPress: () => _onPress(widget.sentValueLeft),
            bottomPress: () => _onPress(widget.sentValueDown),
          ),
          onTapUp: (details) => setState(() {
            pressedButton = _PressedButton.none;
          }),
          onTapCancel: () => setState(() {
            pressedButton = _PressedButton.none;
          }),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: DefaultColors.f16ButtonInner,
                gradient: _gradient(),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: _verticalAxis(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: _horizontalAxis(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _horizontalAxis() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "RTN",
              style: TextStyle(
                color: DefaultColors.label,
                fontSize: constraints.maxWidth / 6.5,
              ),
            ),
            Text(
              "SEQ",
              style: TextStyle(
                color: DefaultColors.label,
                fontSize: constraints.maxWidth / 6.5,
              ),
            ),
          ],
        );
      },
    );
  }

  _verticalAxis() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "▲",
              style: TextStyle(
                color: DefaultColors.label,
                fontSize: constraints.maxWidth / 5,
              ),
            ),
            Text(
              "▼",
              style: TextStyle(
                color: DefaultColors.label,
                fontSize: constraints.maxWidth / 5,
              ),
            ),
          ],
        );
      },
    );
  }

  _gradient() {
    if (pressedButton == _PressedButton.left ||
        pressedButton == _PressedButton.right) {
      return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: _gradientColors(),
      );
    } else {
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: _gradientColors(),
      );
    }
  }

  _gradientColors() {
    if (pressedButton == _PressedButton.left ||
        pressedButton == _PressedButton.top) {
      return [
        DefaultColors.f16ButtonInnerDepress,
        DefaultColors.f16ButtonInner,
        DefaultColors.f16ButtonInnerElevated,
      ];
    } else if (pressedButton == _PressedButton.right ||
        pressedButton == _PressedButton.bottom) {
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

  _getTapLocation({
    required BoxConstraints constraints,
    required TapDownDetails details,
    required Function() topPress,
    required Function() bottomPress,
    required Function() rightPress,
    required Function() leftPress,
  }) {
    //Im sure theres a smart way to do this but I have no idea how to google it so I'm doing it on my own autistic way

    var positionX = details.localPosition.dx;
    var positionY = details.localPosition.dy;
    var centerPositionX = constraints.maxWidth / 2;
    var centerPositionY = constraints.maxHeight / 2;

    if (positionY.compareTo(centerPositionY) == -1 &&
        positionX.compareTo(centerPositionX) == 1) {
      var remainingToCenterY = centerPositionY - positionY;
      var remainingToCenterX = positionX - centerPositionX;
      if (remainingToCenterX > remainingToCenterY) {
        rightPress();
        setState(() {
          pressedButton = _PressedButton.right;
        });
      } else {
        topPress();
        setState(() {
          pressedButton = _PressedButton.top;
        });
      }
    }
    if (positionY.compareTo(centerPositionY) == 1 &&
        positionX.compareTo(centerPositionX) == -1) {
      var remainingToCenterY = positionY - centerPositionY;
      var remainingToCenterX = centerPositionX - positionX;
      if (remainingToCenterX > remainingToCenterY) {
        leftPress();
        setState(() {
          pressedButton = _PressedButton.left;
        });
      } else {
        bottomPress();
        setState(() {
          pressedButton = _PressedButton.bottom;
        });
      }
    }
    if (positionY.compareTo(centerPositionY) == -1 &&
        positionX.compareTo(centerPositionX) == -1) {
      var remainingToCenterY = centerPositionY - positionY;
      var remainingToCenterX = centerPositionX - positionX;
      if (remainingToCenterX > remainingToCenterY) {
        leftPress();
        setState(() {
          pressedButton = _PressedButton.left;
        });
      } else {
        topPress();
        setState(() {
          pressedButton = _PressedButton.top;
        });
      }
    }
    if (positionY.compareTo(centerPositionY) == 1 &&
        positionX.compareTo(centerPositionX) == 1) {
      var remainingToCenterY = positionY - centerPositionY;
      var remainingToCenterX = positionX - centerPositionX;
      if (remainingToCenterX > remainingToCenterY) {
        rightPress();
        setState(() {
          pressedButton = _PressedButton.right;
        });
      } else {
        bottomPress();
        setState(() {
          pressedButton = _PressedButton.bottom;
        });
      }
    }
  }

  _onPress(Keyboard value) {
    feedbacks.tapVibration();
    feedbacks.tapSound();
    network.sendInput(value);
  }
}
