import 'package:flutter/material.dart';
import 'package:icp_app/app/ui/components/add_keybind.dart';
import 'package:icp_app/core/values/buttons.dart';

class MultiKeybinder extends StatelessWidget {
  final Widget button;
  final List<Keyboard?> keybinds;
  final Function(Keyboard?, int) onAdd;
  final bool square;

  const MultiKeybinder({
    super.key,
    required this.button,
    required this.keybinds,
    required this.onAdd,
    this.square = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: square ? 80 : 100,
            child: Center(
              child: SizedBox(
                width: square ? null : 50,
                child: button,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                for (int i = 0; i < keybinds.length; i++)
                  SizedBox(
                    height: 80,
                    child: AddKeybind(
                      keybind: keybinds[i],
                      position: i,
                      onAdd: onAdd,
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