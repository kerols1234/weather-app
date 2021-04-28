import 'package:flutter/material.dart';
import 'package:weather_app/helpers/data.dart';
import 'package:weather_app/screens/data_screen.dart';

class MainScreen extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  var cityId = "";

  void _saveForm(context) {
    if (!_form.currentState.validate()) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DataScreen(cityId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'city name'),
                  validator: (value) {
                    var s = data.firstWhere((element) =>
                            element["name"] == value.toLowerCase().trim(), orElse: () => null,);
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    if (s == null) {
                      return 'Please provide a valid name of city.';
                    }
                    cityId = s['id'].toString();
                    return null;
                  },
                ),
                TextButton(
                  onPressed: () => _saveForm(context),
                  child: Text("get weather data"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
