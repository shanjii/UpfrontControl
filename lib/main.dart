import 'dart:io';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:ufc_app/app/data/models/payloads/f16_keys_model.dart';
import 'package:ufc_app/app/data/models/connection_model.dart';
import 'package:ufc_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:ufc_app/app/presenters/global_presenters/data_presenter.dart';
import 'package:ufc_app/app/presenters/global_presenters/feedback_presenter.dart';
import 'package:ufc_app/app/ui/pages/home/home_page.dart';
import 'package:ufc_app/startup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late PackageInfo packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  packageInfo = await PackageInfo.fromPlatform();

  await _setDisplaySettings();

  var startup = Startup(instance: await SharedPreferences.getInstance());
  await startup.manageVersion(packageInfo.version);
  String savedIp = await startup.getSavedIp();
  String savedPort = await startup.getSavedPort();
  bool isMuted = await startup.getMutedSetting();
  FeedbackType? haptic = await startup.getHapticSetting();
  bool manageActivity = await startup.getActivitySetting();
  F16KeysModel f16Keys = await startup.getF16Keybinds();
  bool virtualJoystick = await startup.getVirtualjoystickSetting();
  int innactivityTime = 15;
  await startup.cacheSounds();

  runApp(
    App(
      savedIp: savedIp,
      savedPort: savedPort,
      isMuted: isMuted,
      f16keys: f16Keys,
      haptic: haptic,
      innactivityTime: innactivityTime,
      manageActivity: manageActivity,
      virtualJoystick: virtualJoystick,
    ),
  );
}

class App extends StatelessWidget {
  final String savedIp;
  final String savedPort;
  final F16KeysModel f16keys;
  final bool isMuted;
  final int innactivityTime;
  final FeedbackType? haptic;
  final bool manageActivity;
  final bool virtualJoystick;

  const App({
    super.key,
    required this.savedIp,
    required this.savedPort,
    required this.isMuted,
    required this.haptic,
    required this.f16keys,
    required this.innactivityTime,
    required this.manageActivity,
    required this.virtualJoystick,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => FeedbackPresenter(
            muted: isMuted,
            haptic: haptic,
          ),
        ),
        Provider(
          create: (context) => DataPresenter(
            connection: ConnectionModel(
              ip: savedIp,
              port: savedPort,
              virtualJoystick: virtualJoystick,
            ),
            f16KeysValues: f16keys,
            devMode: false,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ActivityPresenter(
            innactivityTime: innactivityTime,
            manageActivity: manageActivity,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Mobile ICP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(
                allowEnterRouteSnapshotting: false,
              ),
            },
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}

_setDisplaySettings() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
}
