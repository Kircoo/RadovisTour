import 'package:flutter/material.dart';
import 'package:radovis_tour/helpers/db_helper.dart';
import 'package:radovis_tour/widgets/about/about_screen.dart';
import 'package:radovis_tour/widgets/favorites/favorites_screen.dart';
import 'package:radovis_tour/widgets/visited/visited_screen.dart';
import 'package:radovis_tour/widgets/weather/weather_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget _cardBuilder(
    String name,
    Function function,
    IconData iconData, {
    int lenght,
    Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: function,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ListTile(
            leading: Icon(
              iconData,
              color: color,
            ),
            title: Text(name),
            trailing: Text(
              lenght == null ? '' : lenght.toString(),
            ),
          ),
        ),
      ),
    );
  }

  int theNumberFav = -1;
  int theNumberVis = -1;

  countFav() async {
    int count = await DBS.countItems('favorites');
    if (mounted) {
      setState(() {
        theNumberFav = count;
      });
    }
  }

  countVis() async {
    int count = await DBS.countItems('visited');
    if (mounted) {
      setState(() {
        theNumberVis = count;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    countFav();
    countVis();
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset('assets/images/radovislogo.png'),
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                  ),
                  child: Text(
                    'Radovish Tour',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _cardBuilder(
                      'About',
                      () {
                        Navigator.of(context).pushNamed(AboutScreen.routeName);
                      },
                      Icons.location_city,
                      color: Colors.brown,
                    ),
                    _cardBuilder(
                      'Favorites',
                      () {
                        Navigator.of(context)
                            .pushNamed(FavoriteScreen.routeName);
                      },
                      Icons.favorite,
                      lenght: theNumberFav,
                      color: Colors.red
                    ),
                    _cardBuilder(
                      'Visited',
                      () {
                        Navigator.of(context)
                            .pushNamed(VisitedScreen.routeName);
                      },
                      Icons.remove_red_eye,
                      lenght: theNumberVis,
                      color: Colors.blueAccent
                    ),
                    _cardBuilder(
                      'Weather',
                      () {
                        Navigator.of(context)
                            .pushNamed(WeatherScreen.routeName);
                      },
                      Icons.cloud,
                      color: Colors.lightBlueAccent
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
