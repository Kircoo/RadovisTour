import 'package:flutter/material.dart';
import 'package:radovis_tour/widgets/subcategories/subcategories_bar.dart';
import 'package:radovis_tour/widgets/subcategories/subcategories_body.dart';

/// SubCategories Screen
class SubCategoriesScreen extends StatefulWidget {
  static const routeName = '/subcategories';
  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SubCategiresBar(),
            SubCategoryBody(),
          ],
        ),
      ),
    );
  }
}
