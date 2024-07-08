import 'package:flutter/material.dart';
import 'package:icp_app/app/common/key_actions.dart';
import 'package:icp_app/app/data/models/payloads/action_model.dart';
import 'package:icp_app/app/ui/components/keybind_selector.dart';
import 'package:icp_app/app/ui/components/text.dart';
import 'package:icp_app/core/values/colors.dart';

class AddKeybind extends StatefulWidget {
  final ActionModel action;
  final Function(String?, int) onAdd;
  final int position;
  const AddKeybind({
    super.key,
    required this.action,
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
                  if (widget.action.key != null)
                    Center(
                      child: defaultText(
                        stringToKeyname(widget.action.key!)!,
                        size: 20,
                      ),
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
