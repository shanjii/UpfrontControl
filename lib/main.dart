import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:icp_app/app/data/models/f16_keys_model.dart';
import 'package:icp_app/app/data/models/ip_model.dart';
import 'package:icp_app/app/presenters/global_presenters/activity_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/configuration_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/feedback_presenter.dart';
import 'package:icp_app/app/presenters/global_presenters/tool_presenter.dart';
import 'package:icp_app/app/ui/pages/home/home_page.dart';
import 'package:icp_app/core/storage/local_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setDisplaySettings();

  final prefs = await SharedPreferences.getInstance();
  var localSettings = LocalSettings(prefs);

  String savedIp = await localSettings.getSavedIp();
  String savedPort = await localSettings.getSavedPort();
  bool isMuted = await localSettings.getMutedSetting();
  FeedbackType? haptic = await localSettings.getHapticSetting();
  bool manageActivity = await localSettings.getActivitySetting();
  F16KeysModel f16Keys = await localSettings.getF16Keybinds();

  int innactivityTime = 15;

  await _cacheSounds();

  runApp(
    App(
      savedIp: savedIp,
      savedPort: savedPort,
      isMuted: isMuted,
      f16keys: f16Keys,
      haptic: haptic,
      innactivityTime: innactivityTime,
      manageActivity: manageActivity,
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

  const App({
    super.key,
    required this.savedIp,
    required this.savedPort,
    required this.isMuted,
    required this.haptic,
    required this.f16keys,
    required this.innactivityTime,
    required this.manageActivity,
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
          create: (context) => ToolPresenter(
            devMode: false,
          ),
        ),
        Provider(
          create: (context) => ConfigurationPresenter(
            connection: ConnectionModel(
              ip: savedIp,
              port: savedPort,
            ),
            f16KeysValues: f16keys,
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

_cacheSounds() async {
  await AudioPlayer().play(
    AssetSource('click1.ogg'),
    volume: 0,
    mode: PlayerMode.lowLatency,
  );
}
