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
  String savedIp = await _getSavedIp();

  runApp(
    App(
      savedIp: savedIp,
    ),
  );
}

class App extends StatelessWidget {
  final String savedIp;

  const App({super.key, required this.savedIp});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => Feedbacks(
            muted: false,
            hapticFeedback: FeedbackType.heavy,
          ),
        ),
        Provider(
          create: (context) => Tools(),
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

_getSavedIp() async {
  final prefs = await SharedPreferences.getInstance();
  var localIp = prefs.getString('ip') ?? "";
  return localIp;
}

_setDisplaySettings() async {
  await Wakelock.enable();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
