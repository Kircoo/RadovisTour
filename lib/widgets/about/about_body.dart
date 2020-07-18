import 'package:flutter/material.dart';
import 'package:radovis_tour/data/about_list.dart';
import 'package:radovis_tour/widgets/aboutitems/aboutitem_screen.dart';

class AboutBody extends StatefulWidget {
  @override
  _AboutBodyState createState() => _AboutBodyState();
}

class _AboutBodyState extends State<AboutBody> {
  List<Color> colors = [
    Colors.red,
    Colors.redAccent,
    Colors.cyan,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.amber,
    Colors.amberAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.purple,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AboutItemScreen.routeName,
                    arguments: aboutList[index].id);
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.arrow_right,
                        color: colors[index],
                      ),
                      title: Text(
                        aboutList[index].name,
                        style: TextStyle(
                          color: colors[index],
                        ),
                      ),
                      trailing: Hero(
                        tag: aboutList[index].id,
                        child: Icon(
                          aboutList[index].icon,
                          color: colors[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        childCount: aboutList.length,
      ),
    );
  }
}
