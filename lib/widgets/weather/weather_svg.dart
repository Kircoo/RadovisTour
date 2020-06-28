import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherSvg extends StatelessWidget {
  final String theTemp;
  final String weatherCode;

  WeatherSvg(
    this.theTemp,
    this.weatherCode,
  );

  Widget _columnReturn(
    String img,
    String desc,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/weather/$img.svg',
              height: 60,
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
        Text(desc),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return weatherCode == 'rain_heavey'
        ? _columnReturn('heavy_rain', 'Substantial rain')
        : (weatherCode == 'rain'
            ? _columnReturn('rain', 'Rain')
            : (weatherCode == 'rain_light'
                ? _columnReturn('rain_light', 'Light rain	')
                : (weatherCode == 'freezing_rain_heavy'
                    ? _columnReturn(
                        'freezing_rain_heavy', 'Substantial freezing rain	')
                    : (weatherCode == 'freezing_rain'
                        ? _columnReturn('freezing_rain', 'Freezing rain	')
                        : (weatherCode == 'freezing_rain_light'
                            ? _columnReturn(
                                'freezing_rain_light', 'Light freezing rain')
                            : (weatherCode == 'freezing_drizzle'
                                ? _columnReturn('freezing_drizzle',
                                    'Light freezing rain falling in fine pieces')
                                : (weatherCode == 'drizzle'
                                    ? _columnReturn('drizzle',
                                        'Light rain falling in very fine drops')
                                    : (weatherCode == 'ice_pellets_heavy'
                                        ? _columnReturn('ice_pellets_heavy',
                                            'Substantial ice pellets')
                                        : (weatherCode == 'ice_pellets'
                                            ? _columnReturn(
                                                'ice_pellets', 'Ice pellets')
                                            : (weatherCode ==
                                                    'ice_pellets_light'
                                                ? _columnReturn(
                                                    'ice_pellets_light',
                                                    'Light ice pellets')
                                                : (weatherCode == 'snow_heavy'
                                                    ? _columnReturn(
                                                        'snow_heavy',
                                                        'Substantial snow')
                                                    : (weatherCode == 'snow'
                                                        ? _columnReturn(
                                                            'snow', 'Snow')
                                                        : (weatherCode ==
                                                                'snow_light'
                                                            ? _columnReturn(
                                                                'snow_light',
                                                                'Light snow')
                                                            : (weatherCode ==
                                                                    'flurries'
                                                                ? _columnReturn(
                                                                    'flurries',
                                                                    'Flurries')
                                                                : (weatherCode ==
                                                                        'tstorm'
                                                                    ? _columnReturn(
                                                                        'tstorm',
                                                                        'Thunderstorm conditions')
                                                                    : (weatherCode ==
                                                                            'fog_light'
                                                                        ? _columnReturn(
                                                                            'fog_light',
                                                                            'Light fog')
                                                                        : (weatherCode ==
                                                                                'fog'
                                                                            ? _columnReturn('fog',
                                                                                'Fog')
                                                                            : (weatherCode == 'cloudy'
                                                                                ? _columnReturn('cloudy', 'Cloudy')
                                                                                : (weatherCode == 'mostly_cloudy'
                                                                                    ? _columnReturn('mostly_cloudy', 'Mostly cloudy')
                                                                                    : (weatherCode == 'partly_cloudy'
                                                                                        ? _columnReturn(DateTime.now().hour > 6 || DateTime.now().hour < 18 ? 'partly_cloudy_day' : 'partly_cloudy_night', 'Partly cloudy')
                                                                                        : (weatherCode == 'mostly_clear'
                                                                                            ? _columnReturn(DateTime.now().hour > 6 && DateTime.now().hour < 18 ? 'mostly_clear_day' : 'mostly_clear_night', 'Mostly clear')
                                                                                            : _columnReturn(
                                                                                                DateTime.now().hour > 6 && DateTime.now().hour < 18 ? 'clear_day' : 'clear_night',
                                                                                                DateTime.now().hour > 6 && DateTime.now().hour < 18 ? 'Sunny' : 'Clear',
                                                                                              ))))))))))))))))))))));
  }
}
