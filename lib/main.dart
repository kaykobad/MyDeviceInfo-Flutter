import 'package:flutter/material.dart';
import 'package:my_device_info/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Device Info',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      home: SplashScreen(),
    );
  }
}
