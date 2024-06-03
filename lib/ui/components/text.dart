import 'package:flutter/material.dart';

Widget defaultText(String text, {double? size}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: size ?? 32,
    ),
  );
}
