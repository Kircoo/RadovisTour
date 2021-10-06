import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/provider/firebase_provider.dart';

class SubCategiresBar extends StatefulWidget {
  @override
  _SubCategiresBarState createState() => _SubCategiresBarState();
}

class _SubCategiresBarState extends State<SubCategiresBar> {
  @override
  Widget build(BuildContext context) {
    final currentCategory =
        Provider.of<FirebaseProvider>(context).currentCategory;
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: currentCategory['catId'],
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    currentCategory['image_url'],
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
                currentCategory['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 4.0,
                top: 4.0,
              ),
              child: IconButton(
                icon: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
      height: 150,
    );
  }
}
