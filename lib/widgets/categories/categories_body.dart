import 'package:flutter/material.dart';
import 'package:radovis_tour/data/categories_list.dart';

class CategoriesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        categories[index].img,
                      ),
                      fit: BoxFit.cover,
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
        childCount: categories.length,
      ),
    );
  }
}
