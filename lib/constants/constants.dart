import 'package:flutter/material.dart';

class ProjectConstants {
  static final List<String> buttonLabels = ["Battery Info", "Connection Info", "Device Info"];
  static final List<IconData> buttonIcons = [Icons.battery_charging_full, Icons.wifi, Icons.devices];
  static final List<Color> buttonColors = [Colors.teal, Colors.blueGrey, Colors.deepOrangeAccent];
  static final String projectName = 'My Device Info';
  static final String courtesy = 'By Kaykobad Reza';

  static final TextStyle white16 = TextStyle(fontSize: 16, color: Colors.white);
  static final TextStyle white32 = TextStyle(fontSize: 32, color: Colors.white);
}