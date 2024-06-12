import 'dart:convert';

import 'package:icp_app/app/data/models/f16_keys_model.dart';
import 'package:icp_app/app/data/models/ip_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationPresenter {
  ConfigurationPresenter({
    required this.connection,
    required this.f16KeysValues,
  });

  ConnectionModel connection;

  //Replace name with f16CurrentKeys, add a new class for F16 presets that has 5 f16KeysModel.
  //Whichever preset is selected will be the new F16KeysModel being used here.
  F16KeysModel f16KeysValues;

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

  setF16Keys() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('f16Keys', jsonEncode(f16KeysValues.toJson()));
  }
}
