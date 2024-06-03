import 'package:icp_app/ui/common/display.dart';
import 'package:icp_app/ui/pages/f16/f16_page.dart';
import 'package:icp_app/ui/pages/f18/f18.dart';
import 'package:icp_app/providers/activity.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:flutter/material.dart';
import 'package:icp_app/ui/pages/home/subpages/f16_keybinds.dart';
import 'package:icp_app/ui/pages/home/subpages/f18_keybinds.dart';
import 'package:icp_app/ui/pages/settings/settings.dart';
import 'package:provider/provider.dart';

goToF18(BuildContext context) {
  context.read<Activity>().start();
  context.read<Feedbacks>().cacheSound();

  setDisplayFullscreen();

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const F18()),
  ).then((x) => setDisplayDefault());
}

goToF16(BuildContext context) {
  context.read<Activity>().start();
  context.read<Feedbacks>().cacheSound();

  setDisplayFullscreen();

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const F16Page()),
  ).then((x) => setDisplayDefault());
}

goToSettings(BuildContext context) {
  setPortrait();

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Settings()),
  ).then((x) => setLandscape());
}

goToF16Settings(BuildContext context) {
  setPortrait();

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const F16KeybindsPage()),
  ).then((x) => setLandscape());
}

goToF18Settings(BuildContext context) {
  setPortrait();

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const F18KeybindsPage()),
  ).then((x) => setLandscape());
}
