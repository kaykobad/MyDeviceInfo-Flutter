import 'package:flutter/material.dart';
import 'file:///F:/Projects/Flutter/my_device_info/lib/widgets/battery_info_widget.dart';
import 'file:///F:/Projects/Flutter/my_device_info/lib/widgets/connection_info_widget.dart';
import 'file:///F:/Projects/Flutter/my_device_info/lib/constants/constants.dart';
import 'package:my_device_info/widgets/device_info_widget.dart';

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
    return DeviceInfo();
  }
}
