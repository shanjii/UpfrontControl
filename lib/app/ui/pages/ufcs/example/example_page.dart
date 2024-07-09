import 'package:ufc_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _F18State();
}

class _F18State extends State<ExamplePage> {
  late ActivityPresenter activity;

  @override
  void dispose() {
    activity.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    activity = context.read<ActivityPresenter>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: DefaultColors.black,
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
