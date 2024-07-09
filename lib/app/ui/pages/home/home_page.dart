import 'package:icp_app/app/presenters/home_presenter.dart';
import 'package:icp_app/app/ui/components/text.dart';
import 'package:icp_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomePresenter(context),
      child: Consumer(
        builder: (context, HomePresenter controller, _) {
          return Scaffold(
            backgroundColor: DefaultColors.gray4,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: DefaultColors.gray4,
              title: defaultText("Select your module", size: 23),
              actions: [
                _settingsButton(context, controller),
              ],
            ),
            body: OrientationBuilder(
              builder: (context, orientation) {
                if (orientation == Orientation.landscape) {
                  return _landscapeMenu(context, controller);
                } else {
                  return _portraitMenu(context, controller);
                }
              },
            ),
          );
        },
      ),
    );
  }

  _landscapeMenu(BuildContext context, HomePresenter controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _cardOption(
          context,
          title: "F16",
          onPress: () => controller.goToF16(context),
          settings: () => controller.goToF16Settings(context),
        ),
        _cardOption(
          context,
          title: "F18",
          onPress: () => controller.goToF18(context),
          settings: () => controller.goToF18Settings(context),
        ),
      ],
    );
  }

  _portraitMenu(BuildContext context, HomePresenter controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _cardOption(
          context,
          title: "F16",
          onPress: () => controller.goToF16(context),
          settings: () => controller.goToF16Settings(context),
        ),
        _cardOption(
          context,
          title: "F18",
          onPress: () => controller.goToF18(context),
          settings: () => controller.goToF18Settings(context),
        ),
      ],
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

  _settingsButton(BuildContext context, HomePresenter controller) {
    return IconButton(
      onPressed: () => controller.goToSettings(context),
      icon: const Icon(
        Icons.settings,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
