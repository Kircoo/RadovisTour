import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather with ChangeNotifier {
  dynamic temp;
  dynamic feelsLike;
  dynamic sunrise;
  dynamic sunset;
  dynamic weatherDescription;
  dynamic moonPhase;
  dynamic humidity;
  dynamic noData;
  dynamic weatherIcon;

  Future<void> getWeather() async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Radovis&units=metric&appid=c5e4541c30558142b5d751c5cef5e555');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var t = jsonDecode(data)['main']['temp'];
      var f = jsonDecode(data)['main']['feels_like'];
      var sunr = jsonDecode(data)['sys']['sunrise'];
      var suns = jsonDecode(data)['sys']['sunset'];
      var weather = jsonDecode(data)['weather'][0]['description'];
      var h = jsonDecode(data)['main']['humidity'];
      var wI = jsonDecode(data)['weather'][0]['icon'];

      temp = t;
      feelsLike = f;
      sunrise = sunr;
      sunset = suns;
      weatherDescription = weather;
      humidity = h;
      weatherIcon = wI;
    } else {
      noData = 'no Data';
    }
  }
}
