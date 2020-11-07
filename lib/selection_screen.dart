import 'package:flutter/material.dart';

class OptionSelectionPage extends StatelessWidget {
  final List<String> _buttonLabels = ["Battery Info", "Connection Info", "Device Info"];
  final List<IconData> _buttonIcons = [Icons.battery_charging_full, Icons.wifi, Icons.devices];
  final List<Color> _buttonColors = [Colors.blueGrey, Colors.teal, Colors.deepOrangeAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getButton(0),
              _getButton(1),
              _getButton(2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getButton(index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
      child: RaisedButton.icon(
        color: _buttonColors[index],
        padding: EdgeInsets.all(12.0),
        icon: Icon(
          _buttonIcons[index],
          color: Colors.white,
          size: 20,
        ),
        label: Text(
          _buttonLabels[index],
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
            side: BorderSide(color: _buttonColors[index])
        ),
        onPressed: (){},
      ),
    );
  }
}
