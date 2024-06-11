import 'package:flutter/material.dart';
import 'package:icp_app/app/ui/components/keybind_selector.dart';
import 'package:icp_app/app/ui/components/text.dart';
import 'package:icp_app/core/values/buttons.dart';
import 'package:icp_app/core/values/colors.dart';

class AddKeybind extends StatefulWidget {
  final Keyboard? keybind;
  final Function(Keyboard?, int) onAdd;
  final int position;
  const AddKeybind({
    super.key,
    required this.keybind,
    required this.onAdd,
    this.position = 0,
  });

  @override
  State<AddKeybind> createState() => _AddKeybindState();
}

class _AddKeybindState extends State<AddKeybind> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: DefaultColors.backgroundLight2,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => keybindSelector(context, widget.onAdd, widget.position),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.keybind != null)
                    Center(
                      child: defaultText(widget.keybind!.name, size: 20),
                    )
                  else
                    Center(
                      child: defaultText("Add", size: 20),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
