import 'package:app/pages/f16/f16.dart';
import 'package:app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

_displaySettings() {
  Wakelock.enable();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _displaySettings();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Sounds(),
      child: MaterialApp(
        title: 'Mobile ICP',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const F16(),
      ),
    );
  }
}
