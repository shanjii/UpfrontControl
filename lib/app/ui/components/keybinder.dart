import 'package:flutter/material.dart';
import 'package:icp_app/app/ui/components/add_keybind.dart';
import 'package:icp_app/core/values/buttons.dart';

class Keybinder extends StatelessWidget {
  final Widget button;
  final Keyboard? keybind;
  final Function(Keyboard?, int) onAdd;

  const Keybinder({
    super.key,
    required this.button,
    required this.keybind,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: button,
          ),
          Expanded(
            child: AddKeybind(
              keybind: keybind,
              onAdd: onAdd,
            ),
          ),
        ],
      ),
    );
  }
}
