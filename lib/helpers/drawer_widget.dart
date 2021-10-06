import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/helpers/db_helper.dart';
import 'package:radovis_tour/provider/sign_in_google_provider.dart';
import 'package:radovis_tour/widgets/about/about_screen.dart';
import 'package:radovis_tour/widgets/favorites/favorites_screen.dart';
import 'package:radovis_tour/widgets/map/maps.dart';
import 'package:radovis_tour/widgets/signin/sign_in.dart';
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
    dynamic lenght,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: function as void Function()?,
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
            trailing: lenght,
          ),
        ),
      ),
    );
  }

  int? theNumberFav = -1;
  int? theNumberVis = -1;

  countFav() async {
    int? count = await DBS.countItems('favorites');
    if (mounted) {
      setState(() {
        theNumberFav = count;
      });
    }
  }

  countVis() async {
    int? count = await DBS.countItems('visited');
    if (mounted) {
      setState(() {
        theNumberVis = count;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    countFav();
    countVis();
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currentUser == null
                      ? Text('')
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Welcome ${currentUser.displayName}',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
                          Navigator.of(context)
                              .pushNamed(AboutScreen.routeName);
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
                        lenght: Text(
                          theNumberFav.toString(),
                        ),
                        color: Colors.red,
                      ),
                      _cardBuilder(
                        'Visited',
                        () {
                          Navigator.of(context)
                              .pushNamed(VisitedScreen.routeName);
                        },
                        Icons.remove_red_eye,
                        lenght: Text(
                          theNumberVis.toString(),
                        ),
                        color: Colors.blueAccent,
                      ),
                      _cardBuilder(
                        'Weather',
                        () {
                          Navigator.of(context)
                              .pushNamed(WeatherScreen.routeName);
                        },
                        Icons.cloud,
                        color: Colors.lightBlueAccent,
                      ),
                      _cardBuilder(
                        'Map',
                        () {
                          Navigator.of(context)
                              .pushNamed(RadovisMaps.routeName);
                        },
                        Icons.map,
                        color: Colors.pinkAccent,
                      ),
                      currentUser == null
                          ? _cardBuilder(
                              'Sign in',
                              () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    SignInUser.routeName, (route) => false);
                              },
                              Icons.login,
                            )
                          : _cardBuilder(
                              'Sign out',
                              () async {
                                await Provider.of<SignInGoogleProvider>(context,
                                        listen: false)
                                    .signOutGoogle();
                              },
                              Icons.logout,
                              color: Colors.redAccent,
                              lenght: CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    NetworkImage(currentUser.photoURL!),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
