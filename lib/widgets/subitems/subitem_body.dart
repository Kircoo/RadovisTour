import 'package:flutter/material.dart';
import 'package:radovis_tour/data/subitem_list.dart';
import 'package:radovis_tour/widgets/subitems/subitem_details.dart';

class SubItemBody extends StatefulWidget {
  @override
  _SubItemBodyState createState() => _SubItemBodyState();
}

class _SubItemBodyState extends State<SubItemBody> {
  @override
  Widget build(BuildContext context) {
    final subItem = ModalRoute.of(context).settings.arguments as String;
    final selectedSubItem =
        subItems.firstWhere((item) => item.subCategoryId == subItem);
    return SliverFillRemaining(
      fillOverscroll: true,
      hasScrollBody: false,
      child: Container(
        child: SubItemDetails(
          id: selectedSubItem.subCategoryId,
          name: selectedSubItem.name,
          desc: selectedSubItem.description,
          lon: selectedSubItem.lon,
          lat: selectedSubItem.lat,
        ),
      ),
    );
  }
}
