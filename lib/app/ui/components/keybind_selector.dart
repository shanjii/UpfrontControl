import 'package:flutter/material.dart';
import 'package:icp_app/app/common/key_actions.dart';
import 'package:icp_app/app/ui/components/text.dart';
import 'package:icp_app/core/values/buttons.dart';
import 'package:icp_app/core/values/colors.dart';

keybindSelector(
  BuildContext context,
  Function(String?, int) onAdd,
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
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 4,
        children: [
          for (var key in Keyboard.values)
            _button(
              context,
              key: key.value,
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
  required String key,
  required Function(String?, int) onAdd,
  required int position,
}) {
  return TextButton(
    onPressed: () {
      onAdd(key, position);
      Navigator.pop(context);
    },
    child: Center(
      child: defaultText(stringToKeyname(key), size: 16, centered: true),
    ),
  );
}
