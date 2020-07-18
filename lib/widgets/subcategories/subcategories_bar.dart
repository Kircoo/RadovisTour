import 'package:flutter/material.dart';
import 'package:radovis_tour/data/categories_list.dart';

class SubCategiresBar extends StatefulWidget {
  @override
  _SubCategiresBarState createState() => _SubCategiresBarState();
}

class _SubCategiresBarState extends State<SubCategiresBar> {
  @override
  Widget build(BuildContext context) {
    ///Gets the title of the category by argument of [id]
    final subCatItemId = ModalRoute.of(context).settings.arguments as int;
    final selectedSubId =
        categories.firstWhere((subItem) => subItem.id == subCatItemId);
    return Container(
      // backgroundColor: Colors.transparent,
      // pinned: true,
      child: Stack(
        children: [
          Hero(
            tag: selectedSubId.id,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    selectedSubId.img,
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
                selectedSubId.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      height: 150,
    );
  }
}
