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
  int selectedPage = 0;
  PageController _pageController;

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
      itemBuilder: (ctx, index) => _items(index),
      itemCount: displayedSubCategories.length,
    );
  }

  Widget _items(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (ctx, widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.2)).clamp(0.0, 1);
        }

        return Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SubItemScreen.routeName,
                        arguments: displayedSubCategories[index].id);
                    
                  },
                  child: Stack(
                    children: [
                      Hero(
                        tag: displayedSubCategories[index].id,
                        child: Container(
                          height: Curves.easeInOut.transform(value) * MediaQuery.of(context).size.height * 0.6,
                          width: Curves.easeInOut.transform(value) * 300,
                          margin: EdgeInsets.all(5),
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
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Material(
                              color: Colors.transparent.withOpacity(0),
                              child: ListTile(
                                leading: Text(
                                  displayedSubCategories[index].name,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.info,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(10),
            //     ),
            //   ),
            //   width: double.infinity,
            //   height: MediaQuery.of(context).size.height * 0.13,
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(10),
            //       ),
            //     ),
            //     color: Colors.red,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text('vvmro'),
            //           Row(
            //             children: [
            //               Icon(Icons.ac_unit),
            //               Icon(Icons.access_alarm),
            //               Icon(Icons.accessibility),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
