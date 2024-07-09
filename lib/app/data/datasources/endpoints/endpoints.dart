import 'package:ufc_app/app/data/models/connection_model.dart';

releaseKeyUrl(ConnectionModel connection) {
  return Uri.parse(
    'http://${connection.ip}:${connection.port}/${connection.virtualJoystick ? 'release-vjoy' : 'release-keyboard'}',
  );
}

pressKeyUrl(ConnectionModel connection) {
  return Uri.parse(
    'http://${connection.ip}:${connection.port}/${connection.virtualJoystick ? 'press-vjoy' : 'press-keyboard'}',
  );
}
