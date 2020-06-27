import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/data/favorites_list.dart';
import 'package:radovis_tour/helpers/db_helper.dart';
import 'package:radovis_tour/provider/data_provider.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';

class FavoriteScreen extends StatefulWidget {
  static const routeName = '/favorites';

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: Container(
          child: FutureBuilder(
            future: Provider.of<DataProvider>(context, listen: false)
                .fetchFavorites(),
            builder: (ctx, snapshot) => favoritesList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Your favorite list is empty!'),
                        Icon(Icons.sentiment_dissatisfied),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              SubItemScreen.routeName,
                              arguments: favoritesList[index].id);
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
                              favoritesList[index].name,
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
                                      'Favorites',
                                      favoritesList[index].id,
                                      '${favoritesList[index].name}',
                                      'Favorites',
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
                    itemCount: favoritesList.length,
                  ),
          ),
        ),
      ),
    );
  }
}
