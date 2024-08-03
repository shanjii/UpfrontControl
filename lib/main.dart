import 'dart:io';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:ufc_app/app/presentation/providers/activity_provider.dart';
import 'package:ufc_app/app/presentation/providers/settings_provider.dart';
import 'package:ufc_app/app/presentation/providers/feedback_provider.dart';
import 'package:ufc_app/app/presentation/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late PackageInfo packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  packageInfo = await PackageInfo.fromPlatform();

  await _checkVersion();
  await _setDisplaySettings();

  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SettingsProvider()),
        Provider(create: (context) => FeedbackProvider()),
        ChangeNotifierProvider(create: (context) => ActivityProvider()),
      ],
      child: Consumer3<FeedbackProvider, SettingsProvider, ActivityProvider>(
        builder: (context, feedback, settings, activity, child) {
          return MaterialApp(
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
          );
        },
      ),
    );
  }
}

_checkVersion() async {
  SharedPreferences instance = await SharedPreferences.getInstance();
  String? installedVersion = instance.getString("version");
  if (packageInfo.version != installedVersion) {
    await instance.clear();
  }
  await instance.setString("version", packageInfo.version);
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
