import 'package:icp_app/pages/home/home.dart';
import 'package:icp_app/providers/activity.dart';
import 'package:icp_app/providers/network.dart';
import 'package:icp_app/providers/feedbacks.dart';
import 'package:icp_app/providers/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setDisplaySettings();
  final prefs = await SharedPreferences.getInstance();

  String savedIp = await _getSavedIp(prefs);
  bool isMuted = await _getMutedSetting(prefs);
  FeedbackType haptic = await _getHapticSetting(prefs);
  bool manageActivity = await _getActivitySetting(prefs);
  int innactivityTime = 15;

  runApp(
    App(
      savedIp: savedIp,
      isMuted: isMuted,
      haptic: haptic,
      innactivityTime: innactivityTime,
      manageActivity: manageActivity,
    ),
  );
}

class App extends StatelessWidget {
  final String savedIp;
  final bool isMuted;
  final int innactivityTime;
  final FeedbackType haptic;
  final bool manageActivity;

  const App({
    super.key,
    required this.savedIp,
    required this.isMuted,
    required this.haptic,
    required this.innactivityTime,
    required this.manageActivity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => Feedbacks(
            muted: isMuted,
            haptic: haptic,
          ),
        ),
        Provider(
          create: (context) => Tools(devMode: false),
        ),
        Provider(
          create: (context) => Network(localIp: savedIp),
        ),
        ChangeNotifierProvider(
          create: (context) => Activity(
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
        home: const Home(),
      ),
    );
  }
}

_getSavedIp(SharedPreferences prefs) async {
  return prefs.getString('ip') ?? "";
}

_getMutedSetting(SharedPreferences prefs) async {
  return prefs.getBool('muted') ?? false;
}

_getActivitySetting(SharedPreferences prefs) async {
  return prefs.getBool('manage-activity') ?? false;
}

_getHapticSetting(SharedPreferences prefs) async {
  var value = prefs.getString("haptic");
  if (value != null) {
    return FeedbackType.values.byName(value);
  } else {
    return FeedbackType.medium;
  }
}

_setDisplaySettings() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
