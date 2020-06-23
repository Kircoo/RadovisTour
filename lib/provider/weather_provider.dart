import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather with ChangeNotifier {

  Future<void> getWeather(int a, int b,) async {
    final url = 'https://api.climacell.co/v3/weather/realtime?lat=41.6395&lon=22.467900000000004&location_id=5ea86e26240472001327fea3&fields%5B%5D=temp&fields%5B%5D=feels_like&fields%5B%5D=sunset&fields%5B%5D=sunrise&fields%5B%5D=weather_code&apikey=iONd0moC4XfTbhglsxj2HyWYyH0CL1Dy';
    final response = await http.get(url);
    final hh = jsonDecode(response.body);
    print(hh);
  }

}