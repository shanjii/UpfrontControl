import 'package:app/providers/feedbacks.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class F18 extends StatelessWidget {
  const F18({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    context.read<Feedbacks>().initSoundF18();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: DefaultColors.backgroundOled,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
