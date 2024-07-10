import 'package:ufc_app/app/data/models/ufcs/f16_keys_model.dart';
import 'package:ufc_app/app/data/models/connection_model.dart';
import 'package:ufc_app/app/data/models/ufcs/f18_keys_model.dart';

class DataPresenter {
  DataPresenter({
    required this.devMode,
    required this.connection,
    required this.f16KeysValues,
    required this.f18KeysValues,
  });

  final bool devMode;
  ConnectionModel connection;
  F16KeysModel f16KeysValues;
  F18KeysModel f18KeysValues;
}
