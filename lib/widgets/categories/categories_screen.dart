import 'package:flutter/material.dart';
import 'package:radovis_tour/helpers/drawer_widget.dart';
import 'package:radovis_tour/widgets/categories/categories_bar.dart';
import 'package:radovis_tour/widgets/categories/categories_body.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categories';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        body: CustomScrollView(
          slivers: [
            CategoriesBar(),
            CategoriesBody(),
          ],
        ),
      ),
    );
  }
}
