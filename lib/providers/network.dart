import 'package:icp_app/datasource/input_datasource.dart';
import 'package:icp_app/datasource/models/ip_model.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  Network({required this.connection});

  late ConnectionModel connection;
  InputDatasource inputDatasource = InputDatasource();

  setLocalIp(String newIp) async {
    connection = ConnectionModel(
      ip: newIp,
      port: connection.port,
    );

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('ip', newIp);
  }

  setPort(String newPort) async {
    connection = ConnectionModel(
      ip: connection.ip,
      port: newPort,
    );

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('port', newPort);
  }

  pressKey(Keyboard key) async {
    inputDatasource.pressKey(key, connection);
  }

  releaseKey(Keyboard key) async {
    inputDatasource.releaseKey(key, connection);
  }
}
