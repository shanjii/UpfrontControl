import 'package:app/pages/f16/layout/f16_keypad_layout.dart';
import 'package:app/pages/f16/layout/f16_top_buttons.dart';
import 'package:app/providers/audio.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F16 extends StatelessWidget {
  const F16({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AudioProvider>().initSoundF16();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: DefaultColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: height * 0.2, child: const F16TopButtons()),
          SizedBox(height: height * 0.6, child: const F16KeypadRegion()),
        ],
      ),
    );
  }
}
