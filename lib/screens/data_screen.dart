import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  final cityId;

  DataScreen(this.cityId);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String description = " ", pressure = " ", speed = " ", p = " ";
  int temp = 0;

  @override
  void initState() {
    getData().then((value) => setState(() {}));
    super.initState();
  }

  Future<void> getData() async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?id=${widget.cityId}&appid=1353985852274b0f1a4a51edd9b22734');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      description = extractedData["weather"][0]["description"].toString();
      temp = (extractedData["main"]["temp"] - 273.15).toInt();
      pressure = extractedData["main"]["pressure"].toString();
      speed = extractedData["wind"]["speed"].toString();
      p = " description : $description \n\n temperature : $temp \n\n pressure : $pressure \n\n speed : $speed";
    } catch (error) {
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(description);
    return Scaffold(
      body: Center(
        child: Text(
          p,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
