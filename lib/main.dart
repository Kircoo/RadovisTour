import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radovis_tour/categories/categories_screen.dart';
import 'package:radovis_tour/helpers/custom_page_route.dart';

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
