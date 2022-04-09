import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

genero() {
  return ToggleSwitch(
    minWidth: 110.0,
    initialLabelIndex: 1,
    cornerRadius: 10.0,
    activeFgColor: Colors.white,
    inactiveBgColor: Colors.grey[400],
    inactiveFgColor: Colors.white,
    totalSwitches: 2,
    labels: const ['Homem', 'Mulher'],
    icons: const [Icons.man, Icons.woman],
    activeBgColors: const [
      [Colors.blue],
      [Colors.pink],
    ],
    onToggle: (index) {},
  );
}
