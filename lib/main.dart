import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radovis_tour/provider/sign_in_google_provider.dart';
import 'package:radovis_tour/widgets/firebase/firebase_screen.dart';
import 'package:radovis_tour/widgets/map/maps.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/provider/data_provider.dart';
import 'package:radovis_tour/provider/weather_provider.dart';
import 'package:radovis_tour/widgets/about/about_screen.dart';
import 'package:radovis_tour/widgets/aboutitems/aboutitem_screen.dart';
import 'package:radovis_tour/widgets/categories/categories_screen.dart';
import 'package:radovis_tour/helpers/custom_page_route.dart';
import 'package:radovis_tour/widgets/favorites/favorites_screen.dart';
import 'package:radovis_tour/widgets/signin/sign_in.dart';
import 'package:radovis_tour/widgets/subcategories/subcategories_screen.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';
import 'package:radovis_tour/widgets/visited/visited_screen.dart';
import 'package:radovis_tour/widgets/weather/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Weather(),
          ),
          ChangeNotifierProvider.value(
            value: DataProvider(),
          ),
          ChangeNotifierProvider.value(
            value: SignInGoogleProvider(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
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
      home: SafeArea(
        child: HomePageApp(),
      ),
      routes: {
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
      },
    );
  }
}

/// Home Page Class
class HomePageApp extends StatelessWidget {
  final List<IconData> icons = [
    Icons.location_city,
    Icons.nature,
    Icons.nature,
  ];
  @override
  Widget build(BuildContext context) {
    return SignInUser();
  }
}
