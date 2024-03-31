import 'package:app/pages/home/home.dart';
import 'package:app/providers/network.dart';
import 'package:app/providers/feedbacks.dart';
import 'package:app/providers/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setDisplaySettings();
  final prefs = await SharedPreferences.getInstance();
  String savedIp = await _getSavedIp(prefs);
  bool isMuted = await _getMutedSetting(prefs);
  FeedbackType? haptic = await _getHapticSetting(prefs);

  runApp(
    App(
      savedIp: savedIp,
      isMuted: isMuted,
      haptic: haptic,
    ),
  );
}

class App extends StatelessWidget {
  final String savedIp;
  final bool isMuted;
  final FeedbackType? haptic;

  const App({
    super.key,
    required this.savedIp,
    required this.isMuted,
    required this.haptic,
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
      ],
      child: MaterialApp(
        title: 'Mobile ICP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
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

_getHapticSetting(SharedPreferences prefs) async {
  var value = prefs.getString("haptic");
  if (value != null) {
    if (value == "null") {
      return null;
    }
    return FeedbackType.values.byName(value);
  } else {
    return FeedbackType.medium;
  }
}

_setDisplaySettings() async {
  await Wakelock.enable();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
