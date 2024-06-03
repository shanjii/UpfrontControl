import 'package:flutter/material.dart';
import 'package:icp_app/ui/pages/home/widgets/add_keybind.dart';
import 'package:icp_app/values/buttons.dart';

class MultiKeybinder extends StatefulWidget {
  final Widget button;
  final List<Keyboard?> keybinds;
  final Function(Keyboard?, int) onAdd;

  const MultiKeybinder({
    super.key,
    required this.button,
    required this.keybinds,
    required this.onAdd,
  });

  @override
  State<MultiKeybinder> createState() => _KeybinderState();
}

class _KeybinderState extends State<MultiKeybinder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: widget.button,
          ),
          Expanded(
            child: Column(
              children: [
                for (int i = 0; i < widget.keybinds.length; i++)
                  SizedBox(
                    height: 80,
                    child: AddKeybind(
                      keybind: widget.keybinds[i],
                      position: i,
                      onAdd: widget.onAdd,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
