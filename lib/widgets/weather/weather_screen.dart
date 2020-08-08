import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

class _WeatherScreenState extends State<WeatherScreen>
    with SingleTickerProviderStateMixin {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        isConnected = true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        isConnected = true;
      });
    } else if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isConnected = false;
      });
    }
    return false;
  }

  bool isConnected = true;

  @override
  void initState() {
    check();
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
        body: RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () {
            return Navigator.of(context).pushReplacementNamed(WeatherScreen.routeName);
          },
          child: Stack(
            children: [
              !isConnected
                  ? Container(
                      color: Theme.of(context).primaryColor,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No internet connection!',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.signal_wifi_off,
                              color: Colors.white,
                              size: 55,
                            ),
                          ],
                        ),
                      ),
                    )
                  : FutureBuilder(
                      future: theItems.getWeather(),
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(DateTime.now().hour > 6 &&
                                        DateTime.now().hour < 18
                                    ? 'assets/images/weather/day.png'
                                    : 'assets/images/weather/night.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                height: 100,
                                width: 100,
                                child: SpinKitThreeBounce(
                                  color: Theme.of(context).primaryColor,
                                  size: 50.0,
                                ),
                              ),
                            ),
                          );
                        }
                        return theItems.noData == 'no Data'
                            ? Container(
                                child: Center(
                                  child:
                                      Text('The Weather is not available now!'),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                              theItems.temp != null
                                                  ? '${theItems.temp.toStringAsFixed(0)}°'
                                                  : 'not available',
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
                                                theItems.temp != null
                                                    ? '${theItems.temp.toStringAsFixed(0)}°'
                                                    : 'not available',
                                                Colors.red,
                                              ),
                                              _weatherCard(
                                                WeatherIcons
                                                    .thermometer_exterior,
                                                'Feels Like',
                                                theItems.feelsLike != null
                                                    ? '${theItems.feelsLike.toStringAsFixed(0)}°'
                                                    : 'not available',
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
                                                theItems.humidity != null
                                                    ? '${theItems.humidity.toStringAsFixed(0)}%'
                                                    : 'not available',
                                                Colors.blueAccent,
                                              ),
                                              MoonPhase(
                                                WeatherIcons
                                                    .moon_alt_waning_crescent_3,
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
                      },
                    ),
              ListView(),
            ],
          ),
        ),
      ),
    );
  }
}
