import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather with ChangeNotifier {
  dynamic temp;
  dynamic feelsLike;
  dynamic sunrise;
  dynamic sunset;
  dynamic weatherCode;
  dynamic moonPhase;
  dynamic humidity;
  dynamic noData;

  Future<void> getWeather() async {
    final url =
        'https://api.climacell.co/v3/weather/realtime?lat=41.6395&lon=22.467900000000004&location_id=5ea86e26240472001327fea3&fields%5B%5D=temp&fields%5B%5D=feels_like&fields%5B%5D=humidity&fields%5B%5D=sunrise&fields%5B%5D=sunset&fields%5B%5D=weather_code&fields%5B%5D=moon_phase&apikey=iONd0moC4XfTbhglsxj2HyWYyH0CL1Dy';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var t = jsonDecode(data)['temp']['value'];
      var f = jsonDecode(data)['feels_like']['value'];
      var sunr = jsonDecode(data)['sunrise']['value'];
      var suns = jsonDecode(data)['sunset']['value'];
      var moon = jsonDecode(data)['moon_phase']['value'];
      var weather = jsonDecode(data)['weather_code']['value'];
      var h = jsonDecode(data)['humidity']['value'];

      temp = t;
      feelsLike = f;
      sunrise = sunr;
      sunset = suns;
      moonPhase = moon;
      weatherCode = weather;
      humidity = h;
    } else {
      noData = 'no Data';
    }
  }
}
