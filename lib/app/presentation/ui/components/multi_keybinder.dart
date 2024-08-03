import 'package:flutter/material.dart';
import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/presentation/ui/components/add_keybind.dart';

class MultiKeybinder extends StatelessWidget {
  final Widget button;
  final List<ActionModel> keybinds;
  final Function(String? key, String? modifier, int index) onAdd;
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
                      action: keybinds[i],
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
