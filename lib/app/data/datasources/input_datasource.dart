import 'package:icp_app/app/data/datasources/endpoints/endpoints.dart';
import 'package:icp_app/app/data/models/ip_model.dart';
import 'package:icp_app/core/values/buttons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InputDatasource {
  pressKey(Keyboard key, ConnectionModel connection) async {
    try {
      var result = await http
          .post(
            pressKeyUrl(connection),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(
              {"key": key.value},
            ),
          )
          .timeout(const Duration(seconds: 2));

      if (result.statusCode != 200) {
        print(result.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  releaseKey(Keyboard key, ConnectionModel connection) async {
    try {
      var result = await http
          .post(
            releaseKeyUrl(connection),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(
              {"key": key.value},
            ),
          )
          .timeout(const Duration(seconds: 2));

      if (result.statusCode != 200) {
        print(result.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
