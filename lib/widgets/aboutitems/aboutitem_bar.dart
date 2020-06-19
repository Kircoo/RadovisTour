import 'package:flutter/material.dart';
import 'package:radovis_tour/data/about_list.dart';

class AboutItemBar extends StatefulWidget {
  @override
  _AboutItemBarState createState() => _AboutItemBarState();
}

class _AboutItemBarState extends State<AboutItemBar> {
  @override
  Widget build(BuildContext context) {
    final aboutItem = ModalRoute.of(context).settings.arguments as String;
    final selectedAboutItem =
        aboutList.firstWhere((subItem) => subItem.id == aboutItem);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Hero(
            tag: selectedAboutItem.id,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    selectedAboutItem.image,
                  ),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                selectedAboutItem.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      expandedHeight: 450,
    );
  }
}
