import 'package:flutter/material.dart';
import 'package:ufc_app/app/common/key_actions.dart';
import 'package:ufc_app/app/common/modals.dart';
import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/ui/components/keybind_selector.dart';
import 'package:ufc_app/app/ui/components/text.dart';
import 'package:ufc_app/core/enums/key_type.dart';
import 'package:ufc_app/core/values/colors.dart';

class AddKeybind extends StatefulWidget {
  final ActionModel action;
  final Function(String? key, String? modifier, int) onAdd;
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            _keybindCard(KeyType.key),
            _keybindCard(KeyType.modifer),
          ],
        ),
      ),
    );
  }

  _keybindCard(KeyType type) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        color: _activeColor(type, widget.action),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => defaultBottomSheet(
            context,
            modalWidget: KeybindSelector(
              onAdd: widget.onAdd,
              position: widget.position,
              currentKey: widget.action.key,
              currentModifier: widget.action.modifier,
              type: type,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: _label(type),
            ),
          ),
        ),
      ),
    );
  }

  _activeColor(KeyType type, ActionModel action) {
    if (type == KeyType.key) {
      if (action.key != null) {
        return DefaultColors.gray2;
      } else {
        return DefaultColors.gray3;
      }
    } else {
      if (action.modifier != null) {
        return DefaultColors.gray2;
      } else {
        return DefaultColors.gray3;
      }
    }
  }

  _label(KeyType type) {
    if (type == KeyType.key) {
      if (widget.action.key != null) {
        return Center(
          child: defaultText(
            stringToKey(widget.action.key!)!,
            size: 20,
          ),
        );
      } else {
        return Center(
          child: defaultText("Key", size: 20),
        );
      }
    } else {
      if (widget.action.modifier != null) {
        return Center(
          child: defaultText(
            stringToModifier(widget.action.modifier!)!,
            size: 20,
          ),
        );
      } else {
        return Center(child: defaultText("Modifier", size: 20));
      }
    }
  }
}
