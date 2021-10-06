import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/provider/firebase_provider.dart';
import 'package:radovis_tour/widgets/subcategories/subcategories_screen.dart';

/// SliverList Categories
class CategoriesBody extends StatefulWidget {
  @override
  _CategoriesBodyState createState() => _CategoriesBodyState();
}

class _CategoriesBodyState extends State<CategoriesBody> {
  List<IconData> icons = [
    Icons.location_city,
    Icons.nature,
    Icons.nature,
    Icons.nature,
    Icons.local_drink,
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Provider.of<FirebaseProvider>(context, listen: false)
          .getFireStoreCategories(categories: 'categories'),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData)
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              childCount: 1,
            ),
          );
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  await Provider.of<FirebaseProvider>(context, listen: false)
                      .getFireStoreSubCategories(
                    subCategories: snapshot.data!.docs[index]['collection'],
                  );
                  await Provider.of<FirebaseProvider>(context, listen: false)
                      .getCurrentFireStreCategoryData(
                    categories: 'categories',
                    index: index,
                  );
                  Navigator.of(context)
                      .pushNamed(SubCategoriesScreen.routeName);
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
                        tag: snapshot.data!.docs[index]['catId'],
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              snapshot.data!.docs[index]['image_url'],
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.darken,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(snapshot.data!.docs[index]['name']),
                        trailing: Icon(
                          icons[index],
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            childCount: snapshot.data!.docs.length,
          ),
        );
      },
    );
  }
}
