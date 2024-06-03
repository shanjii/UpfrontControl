import 'package:flutter/material.dart';

inputField({
  required Function(String value) onChanged,
  required Color fillColors,
  required TextEditingController controller,
  Widget? prefix,
  String? hint,
}) {
  return TextField(
    style: const TextStyle(
      color: Colors.white,
      fontSize: 25,
    ),
    keyboardType: TextInputType.number,
    onChanged: onChanged,
    decoration: InputDecoration(
      filled: true,
      prefix: prefix,
      fillColor: fillColors,
      border: InputBorder.none,
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    ),
    controller: controller,
  );
}
