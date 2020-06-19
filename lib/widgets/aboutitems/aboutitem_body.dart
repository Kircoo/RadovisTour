import 'package:flutter/material.dart';
import 'package:radovis_tour/data/about_list.dart';

class AboutItemBody extends StatefulWidget {
  @override
  _AboutItemBodyState createState() => _AboutItemBodyState();
}

class _AboutItemBodyState extends State<AboutItemBody> {
  @override
  Widget build(BuildContext context) {
    final aboutItem = ModalRoute.of(context).settings.arguments as String;
    final selectedAboutItem =
        aboutList.firstWhere((item) => item.id == aboutItem);
    return SliverFillRemaining(
      fillOverscroll: true,
      hasScrollBody: false,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedAboutItem.desc),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
