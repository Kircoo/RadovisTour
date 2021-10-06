import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/provider/firebase_provider.dart';
import 'package:radovis_tour/widgets/subitems/subitem_bar.dart';
import 'package:radovis_tour/widgets/subitems/subitem_body.dart';

class SubItemScreen extends StatefulWidget {
  static const routeName = '/subItem';
  @override
  _SubItemScreenState createState() => _SubItemScreenState();
}

class _SubItemScreenState extends State<SubItemScreen> {
  ScrollController _scrollController = ScrollController();

  bool showFab = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 150) {
        setState(() {
          showFab = true;
        });
      } else if (_scrollController.position.pixels == 0) {
        setState(() {
          showFab = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = Provider.of<FirebaseProvider>(context).currentItem;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SubItemBar(
            id: currentItem.id,
            name: currentItem.name,
            imageUrl: currentItem.imageUrl,
          ),
          SubItemBody(
            id: currentItem.id,
            name: currentItem.name,
            desc: currentItem.description,
            lon: currentItem.lon,
            lat: currentItem.lat,
            imageUrl: currentItem.imageUrl,
          ),
        ],
      ),
      floatingActionButton: !showFab
          ? null
          : FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              mini: true,
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              child: Icon(Icons.arrow_drop_up),
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
