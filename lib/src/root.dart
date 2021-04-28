import 'package:flutter/material.dart';
import 'package:weather_app/screens/main_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      home: MainScreen(),
    );
  }
}
