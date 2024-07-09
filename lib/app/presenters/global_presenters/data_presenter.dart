import 'package:icp_app/app/data/models/payloads/f16_keys_model.dart';
import 'package:icp_app/app/data/models/connection_model.dart';

class DataPresenter {
  DataPresenter({
    required this.devMode,
    required this.connection,
    required this.f16KeysValues,
  });

  final bool devMode;
  ConnectionModel connection;
  F16KeysModel f16KeysValues;
}
