import 'package:icp_app/data/models/ip_model.dart';

releaseKeyUrl(ConnectionModel connection) {
  return Uri.parse('http://${connection.ip}:${connection.port}/release');
}

pressKeyUrl(ConnectionModel connection) {
  return Uri.parse('http://${connection.ip}:${connection.port}/press');
}
