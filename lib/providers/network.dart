import 'package:icp_app/datasource/input_datasource.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  Network({required this.localIp});

  late String localIp;
  InputDatasource inputDatasource = InputDatasource();

  setLocalIp(String ip) async {
    localIp = ip;
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('ip', ip);
  }

  pressKey(Keyboard key) async {
    inputDatasource.pressKey(key, localIp);
  }

  releaseKey(Keyboard key) async {
    inputDatasource.releaseKey(key, localIp);
  }
}
