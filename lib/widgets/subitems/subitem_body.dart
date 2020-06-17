import 'package:flutter/material.dart';
import 'package:radovis_tour/data/subitem_list.dart';

class SubItemBody extends StatefulWidget {
  @override
  _SubItemBodyState createState() => _SubItemBodyState();
}

class _SubItemBodyState extends State<SubItemBody> {
  void buttonFnc(
    dynamic item1,
    dynamic item2,
    dynamic item3,
  ) {
    print(item1);
    print(item2);
    print(item3);
  }

  Widget _wrapIcon(
    IconData iconData,
    dynamic item1,
    dynamic item2,
    dynamic item3,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        top: 8.0,
        left: 8.0,
        bottom: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(45),
        ),
        height: 50,
        width: 50,
        child: GestureDetector(
          onTap: () => buttonFnc(
            item1,
            item2,
            item3,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final subItem = ModalRoute.of(context).settings.arguments as String;
    final selectedSubItem =
        subItems.firstWhere((item) => item.subCategoryId == subItem);
    return SliverFillRemaining(
      fillOverscroll: true,
      hasScrollBody: false,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedSubItem.description),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _wrapIcon(
                        Icons.map,
                        selectedSubItem.description,
                        selectedSubItem.id,
                        selectedSubItem.subCategoryId,
                      ),
                      _wrapIcon(
                        Icons.favorite_border,
                        selectedSubItem.description,
                        selectedSubItem.id,
                        selectedSubItem.subCategoryId,
                      ),
                      _wrapIcon(
                        Icons.visibility_off,
                        selectedSubItem.description,
                        selectedSubItem.id,
                        selectedSubItem.subCategoryId,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
