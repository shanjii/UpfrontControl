import 'package:flutter/material.dart';
import 'package:icp_app/core/values/colors.dart';

defaultBottomSheet(BuildContext context, {required Widget modalWidget}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    backgroundColor: DefaultColors.gray3,
    builder: (context) {
      return modalWidget;
    },
  );
}
