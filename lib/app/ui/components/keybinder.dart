import 'package:flutter/material.dart';
import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/ui/components/add_keybind.dart';

class Keybinder extends StatelessWidget {
  final Widget button;
  final ActionModel keybind;
  final Function(String? key, String? modifier, int) onAdd;

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
              action: keybind,
              onAdd: onAdd,
            ),
          ),
        ],
      ),
    );
  }
}
