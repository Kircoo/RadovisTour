import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/provider/firebase_provider.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';

class SubCategoryBody extends StatefulWidget {
  final List<dynamic>? fireSubList;

  SubCategoryBody({
    this.fireSubList,
  });

  @override
  _SubCategoryBodyState createState() => _SubCategoryBodyState();
}

class _SubCategoryBodyState extends State<SubCategoryBody> {
  int selectedPage = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.7,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: PageScrollPhysics(),
      onPageChanged: (int index) {
        setState(() {
          selectedPage = index;
        });
      },
      itemBuilder: (ctx, index) => _items(
        index,
        widget.fireSubList as List<QueryDocumentSnapshot<Object>>?,
      ),
      itemCount: widget.fireSubList!.length,
    );
  }

  Widget _items(
    int index,
    List<QueryDocumentSnapshot>? fireSubList,
  ) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (ctx, widget) {
        double value = 1;
        if (_pageController!.position.haveDimensions) {
          value = _pageController!.page! - index;
          value = (1 - (value.abs() * 0.2)).clamp(0.0, 1);
        }

        return Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                child: GestureDetector(
                  onTap: () async {
                    await Provider.of<FirebaseProvider>(context, listen: false)
                        .getCurrentItem(
                      name: fireSubList![index]['name'],
                      description: fireSubList[index]['description'],
                      lat: fireSubList[index]['lat'],
                      lon: fireSubList[index]['lon'],
                      id: fireSubList[index].id,
                      imageUrl: fireSubList[index]['image_url'],
                    );

                    Navigator.of(context).pushNamed(SubItemScreen.routeName);
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: fireSubList![index].id,
                        child: Container(
                          height: Curves.easeInOut.transform(value) *
                              MediaQuery.of(context).size.height *
                              0.6,
                          width: Curves.easeInOut.transform(value) * 300,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    fireSubList[index]['image_url'],
                                    color: Colors.black.withOpacity(0.5),
                                    fit: BoxFit.cover,
                                    colorBlendMode: BlendMode.darken,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await Provider.of<FirebaseProvider>(context, listen: false)
                    .getCurrentItem(
                  name: fireSubList[index]['name'],
                  description: fireSubList[index]['description'],
                  lat: fireSubList[index]['lat'],
                  lon: fireSubList[index]['lon'],
                  id: fireSubList[index].id,
                  imageUrl: fireSubList[index]['image_url'],
                );

                Navigator.of(context).pushNamed(SubItemScreen.routeName);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Theme.of(context).primaryColor.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        fireSubList[index]['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
