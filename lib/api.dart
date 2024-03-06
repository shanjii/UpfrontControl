import 'dart:convert';

import 'package:http/http.dart' as http;

void sendInput(String key) async {
  try {
    var result = await http
        .post(
          Uri.parse('http://192.168.15.35:3000/action'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({"modifier": "shift", "key": key}),
        )
        .timeout(const Duration(seconds: 2));

    if (result.statusCode != 200) {
      print(result.statusCode);
    }
  } catch (e) {
    print(e);
  }
}
