import 'package:app/pages/f16/layout/f16_keypad.dart';
import 'package:app/pages/f16/layout/f16_left.dart';
import 'package:app/pages/f16/layout/f16_right.dart';
import 'package:app/pages/f16/layout/f16_top.dart';
import 'package:app/providers/providers.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16 extends StatelessWidget {
  const F16({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    context.read<Sounds>().initSoundF16();
    return Scaffold(
      backgroundColor: DefaultColors.backgroundOled,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.20),
            child: _leftArea(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.6),
            child: _centerArea(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.20),
            child: _rightArea(),
          ),
        ],
      ),
    );
  }

  _leftArea() {
    return const Placeholder(
      child: F16Left(),
    );
  }

  _centerArea() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Placeholder(child: F16Top()),
        Placeholder(child: F16Keypad()),
      ],
    );
  }

  _rightArea() {
    return const Placeholder(
      child: F16Right(),
    );
  }
}
