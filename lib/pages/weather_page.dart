import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapps/services/weather_services.dart';

import '../model/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  //api key
  final _weatherService = WeatherService('db359a0fde31506b5c5a14524515a31a');
  Weather? _weather;

  //fetch weather
  void _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    //get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e)  {print(e);}

    //weather animations

    //init statae
  }

  String getWeatherAnimation(String? mainCondition){
    if (mainCondition == null) return 'assets/cloudy.json';//default

    switch (mainCondition.toLowerCase()) {
    case 'clear':
      return 'assets/sunny.json';
    case 'clouds':
      return 'assets/cloudy.json';
    case 'rain':
      return 'assets/rainy-night.json';
    case 'drizzle':

    case 'thunderstorm':
      return 'assets/thunder.json';
    case 'mist':
    case 'smoke':
    case 'haze':
    case 'dust':
    case 'fog':
    case 'shower rain':
    case 'tornado':
      return 'assets/rainy-night.json';
    default:
      return 'assets/sunny.json';
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather?.cityName ?? "loading city..",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Montserrat',

              ),
            ),
            Text("${_weather?.temperature.round()}°C",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 80.0,
                fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold
              ),
            ),


            //animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            //condition
            Text(_weather?.mainCondition ?? "loading mainCondition..",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Montserrat',
              ),
            ),

          ],
        ),
      )
    );
  }



}

