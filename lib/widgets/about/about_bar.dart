import 'package:flutter/material.dart';

class AboutBar extends StatefulWidget {
  @override
  _AboutBarState createState() => _AboutBarState();
}

class _AboutBarState extends State<AboutBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                    Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              right: 10.0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      expandedHeight: 150,
    );
  }
}
