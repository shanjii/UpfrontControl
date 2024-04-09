import 'package:app/pages/f16/f16.dart';
import 'package:app/pages/f18/f18.dart';
import 'package:app/pages/settings/settings.dart';
import 'package:app/providers/activity.dart';
import 'package:app/providers/feedbacks.dart';
import 'package:app/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: DefaultColors.backgroundLight,
        actions: [_settingsButton(context)],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    child: Material(
                      color: const Color.fromARGB(255, 53, 53, 53),
                      child: InkWell(
                        enableFeedback: false,
                        onTap: () => goToF16(context),
                        child: Center(
                          child: _buttonTitle("F16"),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    child: Material(
                      color: const Color.fromARGB(255, 53, 53, 53),
                      child: InkWell(
                        onTap: () => goToF18(context),
                        child: Center(
                          child: _buttonTitle("F18"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttonTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  _settingsButton(BuildContext context) {
    return IconButton(
      onPressed: () => goToSettings(context),
      icon: const Icon(
        Icons.settings,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  goToSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Settings()),
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

  goToF18(BuildContext context) {
    context.read<Activity>().start();
    context.read<Feedbacks>().cacheSound();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const F18()),
    );
  }
}
