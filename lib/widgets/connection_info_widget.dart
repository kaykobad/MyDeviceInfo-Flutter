import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///F:/Projects/Flutter/my_device_info/lib/constants/constants.dart';

class ConnectionInfo extends StatefulWidget {
  @override
  _ConnectionInfoState createState() => _ConnectionInfoState();
}

class _ConnectionInfoState extends State<ConnectionInfo> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity info.');
        break;
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              ProjectConstants.buttonIcons[1],
              size: 36,
              color: Colors.white,
            ),
            Text(
              " ${ProjectConstants.buttonLabels[1]}",
              style: ProjectConstants.white32,
            )
          ],
        ),
        SizedBox(height: 10),
        _getConnectivityStatus(),
      ],
    );
  }

  Widget _getConnectivityStatus() {
    if (_connectionStatus.endsWith("none")) return Text("You are not connected");
    else if (_connectionStatus.endsWith("wifi")) return Text("You are connected to WiFi");
    else if (_connectionStatus.endsWith("mobile")) return Text("You are connected to Mobile Data");
    return Text(_connectionStatus);
  }
}
