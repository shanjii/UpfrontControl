import 'package:flutter/material.dart';
import 'package:icp_app/ui/pages/home/widgets/add_keybind.dart';
import 'package:icp_app/values/buttons.dart';

class MultiKeybinder extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: button,
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
