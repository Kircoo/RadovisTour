import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/data/visited_list.dart';
import 'package:radovis_tour/helpers/db_helper.dart';
import 'package:radovis_tour/provider/data_provider.dart';
import 'package:radovis_tour/provider/firebase_provider.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';

class VisitedScreen extends StatefulWidget {
  static const routeName = '/visited';

  @override
  _VisitedScreenState createState() => _VisitedScreenState();
}

class _VisitedScreenState extends State<VisitedScreen> {
  var _isInit = true;
  var _isLoading = true;
  var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
      .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn));

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DataProvider>(context).fetchVisited().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Visited'),
        ),
        body: Container(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : FutureBuilder(
                  future: Provider.of<DataProvider>(context, listen: false)
                      .fetchVisited(),
                  builder: (ctx, snapshot) => visitedList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 200,
                                child: Image.asset('assets/splashlogo.png'),
                              ),
                              Text('Your visited list is empty!'),
                              Icon(Icons.sentiment_dissatisfied),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: visitedList.length,
                          itemBuilder: (ctx, index) => Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () async {
                                await Provider.of<FirebaseProvider>(context,
                                        listen: false)
                                    .getCurrentItem(
                                  id: visitedList[index].id,
                                  name: visitedList[index].name,
                                  description: visitedList[index].description,
                                  imageUrl: visitedList[index].imageUrl,
                                  lon: visitedList[index].lon,
                                  lat: visitedList[index].lat,
                                );
                                print(visitedList[index].id);
                                Navigator.of(context).pushNamed(
                                  SubItemScreen.routeName,
                                );
                              },
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    visitedList[index].name,
                                  ),
                                  trailing: Builder(
                                    builder: (context) => IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          DBS.delete(
                                            'visited',
                                            visitedList[index].id,
                                            '${visitedList[index].name}',
                                            'Visited',
                                            context,
                                          );
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
        ),
      ),
    );
  }
}
