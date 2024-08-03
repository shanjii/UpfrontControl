import 'package:ufc_app/app/data/datasources/local/settings_datasource.dart';
import 'package:ufc_app/app/data/models/ufcs/f16_keys_model.dart';
import 'package:ufc_app/app/data/models/connection_model.dart';
import 'package:ufc_app/app/data/models/ufcs/f18_keys_model.dart';

class SettingsProvider {
  SettingsProvider() {
    _init();
  }

  late bool devMode;
  late ConnectionModel connection;
  late F16KeysModel f16KeysValues;
  late F18KeysModel f18KeysValues;

  final SettingsDatasource settingsDatasource = SettingsDatasource();

  _init() async {
    devMode = false;

    connection = await settingsDatasource.getConnectionSettings();
    f16KeysValues = await settingsDatasource.getF16Keybinds();
    f18KeysValues = await settingsDatasource.getF18Keybinds();
  }
}
