import 'package:flutter/material.dart';
import 'package:icp_app/core/values/colors.dart';

class F18KeybindsPage extends StatefulWidget {
  const F18KeybindsPage({super.key});

  @override
  State<F18KeybindsPage> createState() => _F16KeybindsState();
}

class _F16KeybindsState extends State<F18KeybindsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.background,
      appBar: AppBar(
        backgroundColor: DefaultColors.background,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "F18 Keybinds",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
