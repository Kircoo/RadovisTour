import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/helpers/drawer_widget.dart';
import 'package:radovis_tour/provider/weather_provider.dart';
import 'package:radovis_tour/widgets/categories/categories_bar.dart';
import 'package:radovis_tour/widgets/categories/categories_body.dart';
import 'package:radovis_tour/widgets/favorites/favorites_screen.dart';
import 'package:radovis_tour/widgets/visited/visited_screen.dart';
import 'package:radovis_tour/widgets/weather/weather_screen.dart';

/// Categories Screen
class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categories';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final theFunc = Provider.of<Weather>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        body: CustomScrollView(
          slivers: [
            CategoriesBar(),
            CategoriesBody(),
          ],
        ),
        floatingActionButton: CircularMenu(
            curve: Curves.linearToEaseOut,
            reverseCurve: Curves.easeInToLinear,
            toggleButtonColor: Theme.of(context).primaryColor,
            alignment: Alignment.bottomRight,
            items: [
              CircularMenuItem(
                onTap: () {
                  Navigator.of(context).pushNamed(FavoriteScreen.routeName);
                },
                icon: Icons.favorite,
                color: Theme.of(context).primaryColor,
              ),
              CircularMenuItem(
                onTap: () {
                  Navigator.of(context).pushNamed(VisitedScreen.routeName);
                },
                icon: Icons.remove_red_eye,
                color: Theme.of(context).primaryColor,
              ),
              CircularMenuItem(
                onTap: () {
                  Navigator.of(context).pushNamed(WeatherScreen.routeName);
                },
                icon: Icons.cloud,
                color: Theme.of(context).primaryColor,
              ),
            ]),
      ),
    );
  }
}
