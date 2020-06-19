import 'package:flutter/material.dart';
import 'package:radovis_tour/widgets/aboutitems/aboutitem_bar.dart';
import 'package:radovis_tour/widgets/aboutitems/aboutitem_body.dart';

class AboutItemScreen extends StatefulWidget {
  static const routeName = '/aboutItemScreen';

  @override
  _AboutItemScreenState createState() => _AboutItemScreenState();
}

class _AboutItemScreenState extends State<AboutItemScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AboutItemBar(),
            AboutItemBody(),
          ],
        ),
      ),
    );
  }
}
