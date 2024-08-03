import 'package:ufc_app/app/data/datasources/remote/endpoints/endpoints.dart';
import 'package:ufc_app/app/data/models/connection_model.dart';
import 'package:ufc_app/app/data/models/action_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteDatasource {
  final ConnectionModel connection;
  RemoteDatasource(this.connection);

  pressKey(ActionModel action) async {
    try {
      var result = await http
          .post(
            pressKeyUrl(connection),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(action.toJson()),
          )
          .timeout(const Duration(seconds: 2));

      if (result.statusCode != 200) {
        print(result.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  releaseKey(ActionModel action) async {
    try {
      var result = await http
          .post(
            releaseKeyUrl(connection),
            headers: {'Content-Type': 'application/json'},
            body: json.encode(
              action.toJson(),
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
