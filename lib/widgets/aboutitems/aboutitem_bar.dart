import 'package:flutter/material.dart';
import 'package:radovis_tour/data/about_list.dart';

class AboutItemBar extends StatefulWidget {
  @override
  _AboutItemBarState createState() => _AboutItemBarState();
}

class _AboutItemBarState extends State<AboutItemBar> {
  @override
  Widget build(BuildContext context) {
    final aboutItem = ModalRoute.of(context)!.settings.arguments as String?;
    final selectedAboutItem =
        aboutList.firstWhere((subItem) => subItem.id == aboutItem);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      pinned: true,
      title: Text(selectedAboutItem.name),
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
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    selectedAboutItem.icon,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
