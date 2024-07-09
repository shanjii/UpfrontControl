import 'package:flutter/material.dart';
import 'package:ufc_app/app/common/display.dart';
import 'package:ufc_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/f16_keybinds_page.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f16/f16_page.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f18/f18_keybinds.dart';
import 'package:ufc_app/app/ui/pages/ufcs/f18/f18_page.dart';
import 'package:ufc_app/app/ui/pages/settings/settings.dart';
import 'package:provider/provider.dart';

class HomePresenter {
  late ActivityPresenter activity;

  HomePresenter(BuildContext context) {
    activity = context.read<ActivityPresenter>();
  }

  goToF18(BuildContext context) {
    activity.start();

    setDisplayFullscreen();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const F18Page()),
    ).then((x) => setDisplayDefault());
  }

  goToF16(BuildContext context) {
    activity.start();

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
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    ).then((x) => setDisplayDefault());
  }

  goToF16Settings(BuildContext context) {
    setPortrait();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const F16KeybindsPage()),
    ).then((x) => setDisplayDefault());
  }

  goToF18Settings(BuildContext context) {
    setPortrait();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const F18KeybindsPage()),
    ).then((x) => setDisplayDefault());
  }
}
