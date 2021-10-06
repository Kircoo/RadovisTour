import 'package:flutter/material.dart';
import 'package:radovis_tour/widgets/about/about_bar.dart';
import 'package:radovis_tour/widgets/about/about_body.dart';

class AboutScreen extends StatefulWidget {
  static const routeName = '/aboutScreen';

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AboutBar(),
          AboutBody(),
        ],
      ),
    );
  }
}
