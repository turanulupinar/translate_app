import 'package:flutter/material.dart';

SizedBox customSwitchWiget(
    {required Color activeColor,
    required bool isOff,
    required void Function(bool)? onchanged}) {
  return SizedBox(
    height: 35,
    width: 45,
    child: FittedBox(
      fit: BoxFit.cover,
      child:
          Switch(activeColor: activeColor, value: isOff, onChanged: onchanged),
    ),
  );
}
