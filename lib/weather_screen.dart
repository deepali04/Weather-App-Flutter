import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather_provider.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: weatherProvider.isLoading
            ? CircularProgressIndicator()
            : weatherProvider.weatherData != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weatherProvider.weatherData['name'],
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        '${weatherProvider.weatherData['main']['temp']}°C',
                        style: TextStyle(fontSize: 64),
                      ),
                      Text(
                        weatherProvider.weatherData['weather'][0]['description'],
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      weatherProvider.fetchWeatherData();
                    },
                    child: Text('Fetch Weather'),
                  ),
      ),
    );
  }
}
