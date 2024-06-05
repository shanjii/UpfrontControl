import 'package:flutter/material.dart';

Widget defaultText(String text, {double? size, bool centered = false}) {
  return Text(
    text,
    textAlign: centered ? TextAlign.center : null,
    style: TextStyle(
      color: Colors.white,
      fontSize: size ?? 32,
    ),
  );
}
