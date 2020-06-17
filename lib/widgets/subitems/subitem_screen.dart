import 'package:flutter/material.dart';
import 'package:radovis_tour/widgets/subitems/subitem_bar.dart';
import 'package:radovis_tour/widgets/subitems/subitem_body.dart';

class SubItemScreen extends StatefulWidget {
  static const routeName = '/subItem';
  @override
  _SubItemScreenState createState() => _SubItemScreenState();
}

class _SubItemScreenState extends State<SubItemScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SubItemBar(),
            SubItemBody(),
          ],
        ),
      ),
    );
  }
}
