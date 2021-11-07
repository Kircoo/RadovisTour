import 'package:flutter/material.dart';
import 'package:radovis_tour/widgets/about/about_screen.dart';
import 'package:radovis_tour/widgets/aboutitems/aboutitem_screen.dart';
import 'package:radovis_tour/widgets/categories/categories_screen.dart';
import 'package:radovis_tour/widgets/favorites/favorites_screen.dart';
import 'package:radovis_tour/widgets/map/maps.dart';
import 'package:radovis_tour/widgets/signin/sign_in.dart';
import 'package:radovis_tour/widgets/subcategories/subcategories_screen.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';
import 'package:radovis_tour/widgets/visited/visited_screen.dart';
import 'package:radovis_tour/widgets/weather/weather_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
  SubCategoriesScreen.routeName: (ctx) => SubCategoriesScreen(),
  SubItemScreen.routeName: (ctx) => SubItemScreen(),
  AboutScreen.routeName: (ctx) => AboutScreen(),
  AboutItemScreen.routeName: (ctx) => AboutItemScreen(),
  FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
  VisitedScreen.routeName: (ctx) => VisitedScreen(),
  WeatherScreen.routeName: (ctx) => WeatherScreen(),
  RadovisMaps.routeName: (ctx) => RadovisMaps(),
  SignInUser.routeName: (ctx) => SignInUser(),
};
