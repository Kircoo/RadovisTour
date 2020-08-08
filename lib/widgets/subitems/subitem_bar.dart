import 'package:flutter/material.dart';
import 'package:radovis_tour/data/subcategories_list.dart';

class SubItemBar extends StatefulWidget {
  @override
  _SubItemBarState createState() => _SubItemBarState();
}

class _SubItemBarState extends State<SubItemBar> {
  @override
  Widget build(BuildContext context) {
    final subCatItemId = ModalRoute.of(context).settings.arguments as String;
    final selectedSubId =
        subcategories.firstWhere((subItem) => subItem.id == subCatItemId);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Hero(
            tag: selectedSubId.id,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    selectedSubId.image,
                  ),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
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
                selectedSubId.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
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
