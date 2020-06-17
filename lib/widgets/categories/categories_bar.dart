import 'package:flutter/material.dart';

/// SliverAppBar Categories
class CategoriesBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          size: 30,
        ),
      ),
      backgroundColor: Colors.transparent,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/radovislogo.png',
                ),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      expandedHeight: 150,
    );
  }
}
