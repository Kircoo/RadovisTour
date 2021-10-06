import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/provider/firebase_provider.dart';
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
    final fireSubList = Provider.of<FirebaseProvider>(context).subCats;
    return Scaffold(
      body: Column(
        children: [
          SubCategiresBar(),
          Expanded(
            child: SubCategoryBody(
              fireSubList: fireSubList,
            ),
          ),
        ],
      ),
    );
  }
}
