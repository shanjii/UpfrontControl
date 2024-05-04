import 'package:ICPApp/values/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  late String localIp;

  Network({required this.localIp});

  setLocalIp(String ip) async {
    localIp = ip;
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('ip', ip);
  }

  sendInput(Keyboard key) async {
    try {
      var result = await http
          .post(
            Uri.parse('http://$localIp:3000/action'),
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
