import 'package:ufc_app/app/presentation/ui/pages/home/home_provider.dart';
import 'package:ufc_app/app/presentation/ui/components/text.dart';
import 'package:ufc_app/app/presentation/ui/pages/options/options_page.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/f16_keybinds_page.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f16/f16_page.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f18/f18_keybinds.dart';
import 'package:ufc_app/app/presentation/ui/pages/ufcs/f18/f18_page.dart';
import 'package:ufc_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeProvider(context),
      child: Consumer<HomeProvider>(
        builder: (context, controller, _) {
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

  _landscapeMenu(BuildContext context, HomeProvider controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _cardOption(
          context,
          title: "F16",
          onPress: () => controller.navigate(
            context,
            page: const F16Page(),
            module: true,
          ),
          settings: () => controller.navigate(
            context,
            page: const F16KeybindsPage(),
          ),
        ),
        _cardOption(
          context,
          title: "F18",
          onPress: () => controller.navigate(
            context,
            page: const F18Page(),
            module: true,
          ),
          settings: () => controller.navigate(
            context,
            page: const F18KeybindsPage(),
          ),
        ),
      ],
    );
  }

  _portraitMenu(BuildContext context, HomeProvider controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _cardOption(
          context,
          title: "F16",
          onPress: () => controller.navigate(
            context,
            page: const F16Page(),
            module: true,
          ),
          settings: () => controller.navigate(
            context,
            page: const F16KeybindsPage(),
          ),
        ),
        _cardOption(
          context,
          title: "F18",
          onPress: () => controller.navigate(
            context,
            page: const F18Page(),
            module: true,
          ),
          settings: () => controller.navigate(
            context,
            page: const F18KeybindsPage(),
          ),
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
                  Icons.edit_note_rounded,
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

  _settingsButton(BuildContext context, HomeProvider controller) {
    return IconButton(
      onPressed: () => controller.navigate(context, page: const OptionsPage()),
      icon: const Icon(
        Icons.settings,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
