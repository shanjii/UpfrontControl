import 'package:flutter/material.dart';
import 'package:ufc_app/app/common/display.dart';
import 'package:ufc_app/app/presentation/providers/activity_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider {
  late ActivityProvider activity;

  HomeProvider(BuildContext context) {
    activity = context.read<ActivityProvider>();
  }

  navigate(
    BuildContext context, {
    required Widget page,
    bool module = false,
  }) {
    if (module) activity.start();

    module ? setDisplayFullscreen() : setPortrait();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ).then((x) => setDisplayDefault());
  }
}
