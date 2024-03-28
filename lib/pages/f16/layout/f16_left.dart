import 'package:flutter/material.dart';

class F16Left extends StatelessWidget {
  const F16Left({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height),
      child: const Align(
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 1,
          child: Placeholder(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
