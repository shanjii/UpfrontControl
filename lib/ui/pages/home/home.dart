import 'package:icp_app/ui/components/text.dart';
import 'package:icp_app/ui/pages/home/home_navigation.dart';
import 'package:icp_app/values/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: DefaultColors.background,
        title: defaultText("Select your module", size: 23),
        actions: [
          _settingsButton(context),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _cardOption(
                  context,
                  title: "F16",
                  onPress: () => goToF16(context),
                  settings: () => goToF16Settings(context),
                ),
                _cardOption(
                  context,
                  title: "F18",
                  onPress: () => goToF18(context),
                  settings: () => goToF18Settings(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _cardOption(
    BuildContext context, {
    required String title,
    required Function() onPress,
    required Function() settings,
  }) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 53, 53, 53),
        child: Stack(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onPress,
              child: Center(
                child: defaultText(title, size: 32),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard,
                  size: 50,
                ),
                color: Colors.white,
                onPressed: settings,
              ),
            )
          ],
        ),
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
}
