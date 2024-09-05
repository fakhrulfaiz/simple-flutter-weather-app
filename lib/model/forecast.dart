
class Forecast{

  final DateTime date;
  final double temperature;
  final String mainCondition;

  Forecast({
    required this.date,
    required this.temperature,
    required this.mainCondition});

  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        temperature: json['main']['temp'].toDouble(),
        mainCondition: json['weather'][0]['main']);
  }
}