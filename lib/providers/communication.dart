import 'package:icp_app/data/datasources/input_datasource.dart';
import 'package:icp_app/data/models/f16_keys_model.dart';
import 'package:icp_app/data/models/ip_model.dart';
import 'package:icp_app/values/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Communication {
  Communication({required this.connection, required this.f16keysModel});

  ConnectionModel connection;
  F16KeysModel f16keysModel;
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

  pressKey(Keyboard? key) async {
    if (key == null) return;
    inputDatasource.pressKey(key, connection);
  }

  releaseKey(Keyboard? key) async {
    if (key == null) return;
    inputDatasource.releaseKey(key, connection);
  }

  setF16Keys(F16KeysModel keys) async {
    f16keysModel = keys;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('f16Keys', keys.toString());
  }
}
