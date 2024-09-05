// forecast_display.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../model/forecast.dart'; // Adjust the import path as needed
import 'package:intl/intl.dart';

class ForecastDisplay extends StatelessWidget {
  final List<Forecast> forecastList;
  final String Function(String mainCondition) getWeatherAnimation;
  final VoidCallback? onPressed;

  const ForecastDisplay({
    super.key,
    required this.forecastList,
    required this.getWeatherAnimation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  GestureDetector(
     onTap: onPressed,
     child: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Container(
         decoration: BoxDecoration(
           color: Colors.white, // Background color for the box
           borderRadius: BorderRadius.circular(12.0), // Rounded corners for the box
           boxShadow: [
             BoxShadow(
               color: Colors.grey.withOpacity(0.3),
               spreadRadius: 1,
               blurRadius: 4,
               offset: Offset(0, 2), // Shadow position for the box
             ),
           ],
         ),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Wrap(

             spacing: 4.0, // Space between cards
             children: forecastList.take(5).map((forecast) {
               final timeFormat =DateFormat.jm(); // "12:00 PM"
               // final formattedTime = timeFormat.format(forecast.date);
               final formattedTime = DateFormat('h a').format(forecast.date); // "12 PM" format
               return SizedBox(
                 width: MediaQuery.of(context).size.width / 5 - 16, // Divide space for 5 cards
                 child: Card(
                   color: Colors.white,
                   margin: EdgeInsets.zero,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
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
                           width: 50,
                           height: 50,
                           child: Lottie.asset(getWeatherAnimation(forecast.mainCondition)),
                         ),
                         const SizedBox(height: 8),
                         Text(
                           formattedTime, // Display formatted time
                           style: const TextStyle(fontSize: 12),
                           textAlign: TextAlign.center,
                         ),
                         // Condition Display
                         Text(
                           forecast.mainCondition,
                           style: const TextStyle(fontSize: 12),
                           textAlign: TextAlign.center,
                         ),
                       ],
                     ),
                   ),
                 ),
               );
             }).toList(),
           ),
         ),
       ),
     ),
   );
  }
}