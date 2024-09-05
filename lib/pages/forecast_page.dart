// forecast_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../model/forecast.dart'; // Adjust the import path as needed

class ForecastPage extends StatelessWidget {
  final List<Forecast> forecasts;
  // Constructor to receive forecast data
  const ForecastPage({super.key,
    required this.forecasts,
    });
  String getWeatherAnimation(String? mainCondition){
    if (mainCondition == null) return 'assets/cloudy.json';//default

    switch (mainCondition.toLowerCase()) {
      case 'clear':
        return 'assets/sunny.json';
      case 'clouds':
        return 'assets/cloudy.json';
      case 'rain':
        return 'assets/rainiy-night.json';
      case 'drizzle':

      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'mist':
        return 'assets/mist.json';
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
      case 'shower rain':
      case 'tornado':
        return 'assets/rainiy-night.json';
      default:
        return 'assets/sunny.json';
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecast',style: TextStyle(
          color: Colors.grey,
        )),
        backgroundColor: Colors.white70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: forecasts.length,
          itemBuilder: (context, index) {
            final forecast = forecasts[index];
            final timeFormat =DateFormat.jm(); // "12:00 PM"
            final formattedTime = DateFormat('h a').format(forecast.date); // "12 PM" format
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.all(2.0),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 2.0,
                  right: 10.0,
                  bottom: 2.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                          // Date Display
                          Text(
                            '${forecast.date.day}/${forecast.date.month}', // Display date as DD/MM
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Weather Animation
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Lottie.asset(getWeatherAnimation(forecast.mainCondition)),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            formattedTime, // Display formatted time
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          // Condition Display
                        const SizedBox(width: 16),
                          Text(
                            forecast.mainCondition,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
