import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radovis_tour/widgets/about/about_screen.dart';
import 'package:radovis_tour/widgets/aboutitems/aboutitem_screen.dart';
import 'package:radovis_tour/widgets/categories/categories_screen.dart';
import 'package:radovis_tour/helpers/custom_page_route.dart';
import 'package:radovis_tour/widgets/favorites/favorites_screen.dart';
import 'package:radovis_tour/widgets/subcategories/subcategories_screen.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';
import 'package:radovis_tour/widgets/visited/visited_screen.dart';

void main() {
  runApp(MyApp());
}

/// Class To Run
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF990000),
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomTransition(),
            TargetPlatform.iOS: CustomTransition(),
          },
        ),
      ),
      home: HomePageApp(),
      routes: {
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        SubCategoriesScreen.routeName: (ctx) => SubCategoriesScreen(),
        SubItemScreen.routeName: (ctx) => SubItemScreen(),
        AboutScreen.routeName: (ctx) => AboutScreen(),
        AboutItemScreen.routeName: (ctx) => AboutItemScreen(),
        FavoriteScreen.routeName: (ctx) => FavoriteScreen(),
        VisitedScreen.routeName: (ctx) => VisitedScreen(),
      },
    );
  }
}

/// Home Page Class
class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoriesScreen();
  }
}
