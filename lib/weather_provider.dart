import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  Map<String, dynamic>? weatherData;

  Future<void> fetchWeatherData() async {
    isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=London&appid=16cf30cd27a8e7482bc734e4ea580714&units=metric'));

    if (response.statusCode == 200) {
      weatherData = json.decode(response.body);
    } else {
      weatherData = null;
    }

    isLoading = false;
    notifyListeners();
  }
}
