import 'package:flutter/material.dart';
import 'package:radovis_tour/data/visited_list.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';

class VisitedScreen extends StatefulWidget {
  static const routeName = '/visited';

  @override
  _VisitedScreenState createState() => _VisitedScreenState();
}

class _VisitedScreenState extends State<VisitedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Visited'),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (ctx, index) => Padding(
              padding: const EdgeInsets.all(6.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SubItemScreen.routeName,
                      arguments: visitedList[index].id);
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      visitedList[index].name,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: visitedList.length,
          ),
        ),
      ),
    );
  }
}
