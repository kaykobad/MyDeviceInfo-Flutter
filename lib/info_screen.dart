import 'package:flutter/material.dart';
import 'package:my_device_info/battery_info_widget.dart';
import 'package:my_device_info/connection_info_widget.dart';
import 'package:my_device_info/constants.dart';

class InfoScreen extends StatelessWidget {
  final int index;

  const InfoScreen({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectConstants.buttonColors[index],
      body: SafeArea(
        child: Center(
          child: _getInfo(index),
        ),
      ),
    );
  }

  Widget _getInfo(int index) {
    if (index == 0) return BatteryInfo();
    else if (index == 1) return ConnectionInfo();
  }
}
