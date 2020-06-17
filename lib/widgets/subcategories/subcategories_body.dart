import 'package:flutter/material.dart';
import 'package:radovis_tour/data/subcategories_list.dart';
import 'package:radovis_tour/models/subcategories_model.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';

class SubCategoryBody extends StatefulWidget {
  @override
  _SubCategoryBodyState createState() => _SubCategoryBodyState();
}

class _SubCategoryBodyState extends State<SubCategoryBody> {
  List<SubCategories> displayedSubCategories;
  var trst = false;

  /// Gets the items by ARGUMENTS
  @override
  void didChangeDependencies() {
    if (!trst) {
      final routeArgs = ModalRoute.of(context).settings.arguments as int;
      final subCategoryId = routeArgs;
      displayedSubCategories = subcategories
          .where((sub) => sub.categoryId == subCategoryId)
          .toList();
      trst = true;
    }
    super.didChangeDependencies();
  }

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
                Navigator.of(context).pushNamed(SubItemScreen.routeName,
                    arguments: subcategories[index].id);
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
                    Hero(
                      tag: displayedSubCategories[index].id,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            ),
                            image: AssetImage(
                              displayedSubCategories[index].image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      title: Text(
                        displayedSubCategories[index].name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        childCount: displayedSubCategories.length,
      ),
    );
  }
}
