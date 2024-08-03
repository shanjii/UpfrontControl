import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soundpool/soundpool.dart';
import 'package:ufc_app/app/data/models/connection_model.dart';
import 'package:ufc_app/app/data/models/interfaces/ufc_interface.dart';
import 'package:ufc_app/app/data/models/ufcs/f16_keys_model.dart';
import 'package:ufc_app/app/data/models/ufcs/f18_keys_model.dart';
import 'package:ufc_app/core/enums/ufcs.dart';
import 'package:ufc_app/core/sounds/sounds.dart';
import 'package:ufc_app/core/values/default_values.dart';

class SettingsDatasource {
  void setConnectionSettings(ConnectionModel connection) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('connection', jsonEncode(connection.toJson()));
  }

  Future<ConnectionModel> getConnectionSettings() async {
    final prefs = await SharedPreferences.getInstance();

    var value = prefs.getString('connection');

    if (value != null) {
      return ConnectionModel.fromJson(jsonDecode(value));
    } else {
      return DefaultValues.connection();
    }
  }

  void setSound(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('muted', value);
  }

  Future<bool> getSound() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('muted') ?? false;
  }

  void setHaptic(FeedbackType? type) async {
    final prefs = await SharedPreferences.getInstance();

    if (type == null) {
      await prefs.setString('haptic', "off");
    } else {
      await prefs.setString('haptic', type.name.toString());
    }
  }

  Future<FeedbackType?> getHaptic() async {
    final prefs = await SharedPreferences.getInstance();

    var value = prefs.getString("haptic");
    if (value == null) {
      return FeedbackType.medium;
    } else if (value == "off") {
      return null;
    } else {
      return FeedbackType.values.byName(value);
    }
  }

  void setOledMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('manage-activity', value);
  }

  Future<bool> getOledMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('manage-activity') ?? false;
  }

  Future<Sounds> loadSounds() async {
    Soundpool pool = Soundpool.fromOptions(
      options: const SoundpoolOptions(streamType: StreamType.notification),
    );

    int clickSound = await rootBundle.load("assets/click1.ogg").then(
      (ByteData soundData) {
        return pool.load(soundData);
      },
    );
    return Sounds(pool: pool, clickSound: clickSound);
  }

  Future<F16KeysModel> getF16Keybinds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getString(Ufcs.f16.value);

    if (value != null) {
      return F16KeysModel.fromJson(jsonDecode(value));
    }

    return DefaultValues.f16Keys();
  }

  Future<F18KeysModel> getF18Keybinds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getString(Ufcs.f18.value);

    if (value != null) {
      return F18KeysModel.fromJson(jsonDecode(value));
    }

    return DefaultValues.f18Keys();
  }

  saveKeys(Ufcs module, Ufc keyValues) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      module.value,
      jsonEncode(keyValues.toJson()),
    );
  }
}
