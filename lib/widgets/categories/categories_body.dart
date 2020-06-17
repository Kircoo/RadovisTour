import 'package:flutter/material.dart';
import 'package:radovis_tour/data/categories_list.dart';
import 'package:radovis_tour/widgets/subcategories/subcategories_screen.dart';

/// SliverList Categories
class CategoriesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(SubCategoriesScreen.routeName,
                  arguments: categories[index].id);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Hero(
                    tag: categories[index].id,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            categories[index].img,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(categories[index].name),
                    trailing: Icon(
                      categories[index].icon,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        childCount: categories.length,
      ),
    );
  }
}
