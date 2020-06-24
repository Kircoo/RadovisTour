import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:radovis_tour/provider/weather_provider.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = '/weatherScreen';

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    Provider.of<Weather>(context, listen: false).getWeather();
    super.initState();
  }

  Widget _weatherCard(IconData icon, String name, String item, Color color) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 0.0),
      child: Card(
        child: ListTile(
          leading: Icon(
            icon,
            color: color,
          ),
          title: Text(name),
          trailing: Text(item),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theItems = Provider.of<Weather>(
      context,
      listen: false,
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
        ),
        body: FutureBuilder(
            future: theItems.getWeather(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return theItems.noData == 'no Data'
                  ? Container(
                      child: Center(
                        child: Text('The Weather is not available now!'),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          height: 200,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on),
                                    Text('Radovish'),
                                  ],
                                ),
                                Text(
                                  DateFormat.yMMMEd().format(
                                    DateTime.now(),
                                  ),
                                ),
                                Text(DateFormat()
                                    .add_Hm()
                                    .format(DateTime.now())
                                    .toString()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/weather/clear_day.svg',
                                      height: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        '${theItems.temp.toStringAsFixed(0)}°',
                                        style: TextStyle(fontSize: 40),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('test')
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                _weatherCard(
                                  WeatherIcons.thermometer,
                                  'Temperature',
                                  '${theItems.temp.toStringAsFixed(0)}°',
                                  Colors.red,
                                ),
                                _weatherCard(
                                  WeatherIcons.thermometer_exterior,
                                  'Feels Like',
                                  '${theItems.feelsLike.toStringAsFixed(0)}°',
                                  Colors.red,
                                ),
                                _weatherCard(
                                  WeatherIcons.sunrise,
                                  'Sunrise',
                                  '${DateFormat().add_Hm().format(DateTime.parse(theItems.sunrise)).toString()}',
                                  Colors.yellow,
                                ),
                                _weatherCard(
                                  WeatherIcons.sunset,
                                  'Sunrise',
                                  '${DateFormat().add_Hm().format(DateTime.parse(theItems.sunset)).toString()}',
                                  Colors.yellow,
                                ),
                                _weatherCard(
                                  WeatherIcons.humidity,
                                  'Humidity',
                                  '${theItems.humidity.toStringAsFixed(0)}%',
                                  Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
            }),
      ),
    );
  }
}
