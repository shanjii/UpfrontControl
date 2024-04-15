import 'package:app/pages/f16/f16.dart';
import 'package:app/pages/f18/f18.dart';
import 'package:app/pages/settings/settings.dart';
import 'package:app/providers/activity.dart';
import 'package:app/providers/feedbacks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

goToF18(BuildContext context) {
  context.read<Activity>().start();
  context.read<Feedbacks>().cacheSound();
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const F18()),
  );
}

goToF16(BuildContext context) {
  context.read<Activity>().start();
  context.read<Feedbacks>().cacheSound();
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const F16()),
  );
}

goToSettings(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Settings()),
  );
}
