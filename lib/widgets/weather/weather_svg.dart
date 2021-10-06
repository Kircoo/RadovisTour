import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherSvg extends StatelessWidget {
  final String theTemp;
  final String imageCode;
  final String weatherDescription;

  WeatherSvg({
    this.theTemp,
    this.imageCode,
    this.weatherDescription,
  });

  String allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'http://openweathermap.org/img/wn/$imageCode@2x.png',
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                theTemp,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
        Text(allWordsCapitilize(weatherDescription)),
      ],
    );
  }
}
