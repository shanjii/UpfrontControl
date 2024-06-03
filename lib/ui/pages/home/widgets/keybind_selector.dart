import 'package:flutter/material.dart';
import 'package:icp_app/ui/components/text.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:icp_app/values/colors.dart';

keybindSelector(
  BuildContext context,
  Function(Keyboard?, int) onAdd,
  int position,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: DefaultColors.backgroundLight,
    builder: (context) {
      return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          for (var key in Keyboard.values)
            _button(
              context,
              key: key,
              onAdd: onAdd,
              position: position,
            ),
        ],
      );
    },
  );
}

_button(
  BuildContext context, {
  required Keyboard key,
  required Function(Keyboard?, int) onAdd,
  required int position,
}) {
  return TextButton(
    onPressed: () {
      onAdd(key, position);
      Navigator.pop(context);
    },
    child: Center(
      child: defaultText(key.name),
    ),
  );
}
