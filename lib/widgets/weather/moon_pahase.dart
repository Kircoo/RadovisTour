import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class MoonPhase extends StatelessWidget {
  final IconData icon;
  final String name;
  final String item;
  final Color color;

  MoonPhase(
    this.icon,
    this.name,
    this.item,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Card(
        color: Colors.white.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: color,
          ),
          title: Text(name),
          trailing: Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: Icon(
              item == 'new_moon'
                  ? WeatherIcons.moon_alt_new
                  : (item == 'waxing_crescent'
                      ? WeatherIcons.moon_alt_waxing_crescent_1
                      : (item == 'waning_crescent'
                          ? WeatherIcons.moon_alt_waning_crescent_1
                          : (item == 'first_quarter'
                              ? WeatherIcons.moon_alt_first_quarter
                              : (item == 'third_quarter'
                                  ? WeatherIcons.moon_alt_third_quarter
                                  : (item == 'waxing_gibbous'
                                      ? WeatherIcons.moon_alt_waxing_gibbous_1
                                      : (item == 'waning_gibbous'
                                          ? WeatherIcons
                                              .moon_alt_waning_gibbous_1
                                          : WeatherIcons.moon_alt_full)))))),
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
