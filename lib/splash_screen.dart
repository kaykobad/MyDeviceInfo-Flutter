import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

import 'package:my_device_info/selection_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OptionSelectionPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "My Device Info",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20,),
                    SpinKitPouringHourglass(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "By Md. Kaykobad Reza",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
