import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:radovis_tour/provider/weather_provider.dart';
import 'package:radovis_tour/widgets/weather/moon_pahase.dart';
import 'package:radovis_tour/widgets/weather/weather_svg.dart';
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
          title: Text(
            name,
            style: TextStyle(color: Colors.black),
          ),
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0x44000000).withOpacity(0),
          elevation: 0,
        ),
        body: FutureBuilder(
            future: theItems.getWeather(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          DateTime.now().hour > 6 && DateTime.now().hour < 18
                              ? 'assets/images/weather/day.png'
                              : 'assets/images/weather/night.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              return theItems.noData == 'no Data'
                  ? Container(
                      child: Center(
                        child: Text('The Weather is not available now!'),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(DateTime.now().hour > 6 &&
                                  DateTime.now().hour < 18
                              ? 'assets/images/weather/day.png'
                              : 'assets/images/weather/night.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                  WeatherSvg(
                                    '${theItems.temp.toStringAsFixed(0)}°',
                                    theItems.weatherCode.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
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
                                    MoonPhase(
                                      WeatherIcons.moon_alt_waning_crescent_3,
                                      'Moon Phase',
                                      '${theItems.moonPhase.toString()}',
                                      Colors.brown,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }),
      ),
    );
  }
}
