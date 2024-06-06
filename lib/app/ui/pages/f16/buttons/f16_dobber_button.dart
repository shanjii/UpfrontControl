import 'package:icp_app/app/presenters/f16_presenter.dart';
import 'package:icp_app/core/values/buttons.dart';
import 'package:icp_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16DobberButton extends StatefulWidget {
  final Keyboard? sentValueUp;
  final Keyboard? sentValueLeft;
  final Keyboard? sentValueDown;
  final Keyboard? sentValueRight;

  const F16DobberButton({
    super.key,
    this.sentValueUp,
    this.sentValueLeft,
    this.sentValueDown,
    this.sentValueRight,
  });

  @override
  State<F16DobberButton> createState() => _F16DobberButtonState();
}

class _F16DobberButtonState extends State<F16DobberButton> {
  _PressedButton pressedButton = _PressedButton.none;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, F16Presenter controller, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Listener(
              onPointerDown: (details) => _getTapLocation(
                constraints: constraints,
                details: details,
                topPress: () => controller.onPress(widget.sentValueUp),
                rightPress: () => controller.onPress(widget.sentValueRight),
                leftPress: () => controller.onPress(widget.sentValueLeft),
                bottomPress: () => controller.onPress(widget.sentValueDown),
              ),
              onPointerUp: (details) => _releaseButton(
                topPress: () => controller.onRelease(widget.sentValueUp),
                rightPress: () => controller.onRelease(widget.sentValueRight),
                leftPress: () => controller.onRelease(widget.sentValueLeft),
                bottomPress: () => controller.onRelease(widget.sentValueDown),
              ),
              onPointerCancel: (details) => _releaseButton(
                topPress: () => controller.onRelease(widget.sentValueUp),
                rightPress: () => controller.onRelease(widget.sentValueRight),
                leftPress: () => controller.onRelease(widget.sentValueLeft),
                bottomPress: () => controller.onRelease(widget.sentValueDown),
              ),
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
    required PointerDownEvent details,
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
        setState(() => pressedButton = _PressedButton.right);
      } else {
        topPress();
        setState(() => pressedButton = _PressedButton.top);
      }
    }
    if (positionY.compareTo(centerPositionY) == 1 &&
        positionX.compareTo(centerPositionX) == -1) {
      var remainingToCenterY = positionY - centerPositionY;
      var remainingToCenterX = centerPositionX - positionX;
      if (remainingToCenterX > remainingToCenterY) {
        leftPress();
        setState(() => pressedButton = _PressedButton.left);
      } else {
        bottomPress();
        setState(() => pressedButton = _PressedButton.bottom);
      }
    }
    if (positionY.compareTo(centerPositionY) == -1 &&
        positionX.compareTo(centerPositionX) == -1) {
      var remainingToCenterY = centerPositionY - positionY;
      var remainingToCenterX = centerPositionX - positionX;
      if (remainingToCenterX > remainingToCenterY) {
        leftPress();
        setState(() => pressedButton = _PressedButton.left);
      } else {
        topPress();
        setState(() => pressedButton = _PressedButton.top);
      }
    }
    if (positionY.compareTo(centerPositionY) == 1 &&
        positionX.compareTo(centerPositionX) == 1) {
      var remainingToCenterY = positionY - centerPositionY;
      var remainingToCenterX = positionX - centerPositionX;
      if (remainingToCenterX > remainingToCenterY) {
        rightPress();
        setState(() => pressedButton = _PressedButton.right);
      } else {
        bottomPress();
        setState(() => pressedButton = _PressedButton.bottom);
      }
    }
  }

  _releaseButton({
    required Function() topPress,
    required Function() bottomPress,
    required Function() rightPress,
    required Function() leftPress,
  }) {
    switch (pressedButton) {
      case _PressedButton.top:
        topPress();
      case _PressedButton.left:
        leftPress();
      case _PressedButton.right:
        rightPress();
      case _PressedButton.bottom:
        bottomPress();
      default:
    }
    setState(() => pressedButton = _PressedButton.none);
  }
}

enum _PressedButton {
  top,
  left,
  right,
  bottom,
  none,
}
