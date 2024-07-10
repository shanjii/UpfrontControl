import 'package:flutter/material.dart';
import 'package:ufc_app/app/common/key_actions.dart';
import 'package:ufc_app/app/ui/components/text.dart';
import 'package:ufc_app/core/enums/key_type.dart';
import 'package:ufc_app/core/enums/keyboard.dart';
import 'package:ufc_app/core/values/colors.dart';

class KeybindSelector extends StatelessWidget {
  final Function(String? key, String? modifier, int) onAdd;
  final int position;
  final String? currentKey;
  final String? currentModifier;
  final KeyType type;
  const KeybindSelector({
    super.key,
    required this.onAdd,
    required this.position,
    this.currentKey,
    this.currentModifier,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 4,
      children: [
        _nullKeybutton(context),
        if (type == KeyType.key)
          for (var key in KeyboardKeys.values)
            _keyButton(
              context,
              type: type,
              value: key.value,
            )
        else
          for (var modifier in KeyboardModifiers.values)
            _keyButton(
              context,
              type: type,
              value: modifier.value,
            )
      ],
    );
  }

  _nullKeybutton(BuildContext context) {
    return Card(
      color: DefaultColors.gray1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (type == KeyType.key) {
            onAdd(null, currentModifier, position);
          } else {
            onAdd(currentKey, null, position);
          }
          Navigator.pop(context);
        },
        child: Center(
          child: defaultText("None", size: 16),
        ),
      ),
    );
  }

  _keyButton(
    BuildContext context, {
    required KeyType type,
    required String value,
  }) {
    return Card(
      color: DefaultColors.gray2,
      child: InkWell(
        onTap: () {
          if (type == KeyType.key) {
            onAdd(value, currentModifier, position);
          } else {
            onAdd(currentKey, value, position);
          }
          Navigator.pop(context);
        },
        child: Center(
          child: defaultText(
            type == KeyType.key ? stringToKey(value) : stringToModifier(value),
            size: 16,
            centered: true,
          ),
        ),
      ),
    );
  }
}
