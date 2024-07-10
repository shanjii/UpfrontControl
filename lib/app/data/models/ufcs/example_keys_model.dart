import 'package:ufc_app/app/data/models/action_model.dart';
import 'package:ufc_app/app/data/models/interfaces/ufc_interface.dart';

class ExampleKeysModel implements Ufc {
  ActionModel example;

  ExampleKeysModel({
    required this.example,
  });

  @override
  Map<String, dynamic> toJson() => {};

  // factory ExampleKeysModel.fromJson(Map<String, dynamic> map) => {};
}
