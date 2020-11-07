import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:flutter/material.dart';
import 'file:///F:/Projects/Flutter/my_device_info/lib/constants/constants.dart';

class BatteryInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              ProjectConstants.buttonIcons[0],
              size: 36,
              color: Colors.white,
            ),
            Text(
              ProjectConstants.buttonLabels[0],
              style: ProjectConstants.white32,
            )
          ],
        ),
        SizedBox(height: 10),
        FutureBuilder<AndroidBatteryInfo>(
          future: BatteryInfoPlugin().androidBatteryInfo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: [
                        Text("Battery Health:"),
                        Text("${snapshot.data.health.toUpperCase()}"),
                      ]
                    ),
                    TableRow(
                        children: [
                          Text("Scale:"),
                          Text("${snapshot.data.scale}"),
                        ]
                    ),
                    TableRow(
                      children: [
                        Text("Voltage:"),
                        Text("${snapshot.data.voltage} mV"),
                      ]
                    ),
                    TableRow(
                        children: [
                          Text("Technology:"),
                          Text("${snapshot.data.technology}"),
                        ]
                    ),
                    TableRow(
                        children: [
                          Text("Temperature:"),
                          Text("${(snapshot.data.temperature)} C"),
                        ]
                    ),
                    TableRow(
                      children: [
                        Text("Battery Level:"),
                        Text("${snapshot.data.batteryLevel}%"),
                      ]
                    ),
                    TableRow(
                        children: [
                          Text("Battery present:"),
                          Text("${snapshot.data.present ? "Yes": "No"}"),
                        ]
                    ),
                    TableRow(
                      children: [
                        Text("Charging status:"),
                        Text("${(snapshot.data.chargingStatus.toString().split(".")[1])}"),
                      ]
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
