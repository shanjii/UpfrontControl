import 'package:flutter/material.dart';
import 'package:icp_app/ui/pages/home/widgets/add_keybind.dart';
import 'package:icp_app/values/buttons.dart';

class Keybinder extends StatefulWidget {
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
  State<Keybinder> createState() => _KeybinderState();
}

class _KeybinderState extends State<Keybinder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: widget.button,
          ),
          Expanded(
            child: AddKeybind(
              keybind: widget.keybind,
              onAdd: widget.onAdd,
            ),
          ),
        ],
      ),
    );
  }
}
