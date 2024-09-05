import 'dart:convert';

import 'package:http/http.dart' as http  ;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:myapps/model/forecast.dart';
import '../model/weather.dart';
class WeatherService {
  static const BASE_URL = "http://api.openweathermap.org/data/2.5";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL/weather?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }

  }

  Future<List<Forecast>> getForecast(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL/forecast?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      // Extract the list of forecasts and map each one to a Forecast object
      List<Forecast> forecastList = (data['list'] as List)
          .map((item) => Forecast.fromJson(item))
          .toList();


      return forecastList;
    } else {
      throw Exception('Failed to load weather data');
    }

  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //fetch location

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
    //convert the location into list

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //convert to city name

    String? city = placemarks[0].locality;

    return city ?? "";
  }

}