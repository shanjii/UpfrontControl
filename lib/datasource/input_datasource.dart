import 'package:icp_app/datasource/endpoints.dart';
import 'package:icp_app/values/buttons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InputDatasource {
  pressKey(Keyboard key, String localIp) async {
    try {
      var result = await http
          .post(
            pressKeyUrl(localIp),
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

  releaseKey(Keyboard key, String localIp) async {
    try {
      var result = await http
          .post(
            releaseKeyUrl(localIp),
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
