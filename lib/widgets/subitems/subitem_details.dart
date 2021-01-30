import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:radovis_tour/helpers/db_helper.dart';

class SubItemDetails extends StatefulWidget {
  final String id;
  final String name;
  final String desc;
  final dynamic lon;
  final dynamic lat;
  final String imageUrl;

  SubItemDetails({
    @required this.id,
    @required this.name,
    @required this.desc,
    @required this.lon,
    @required this.lat,
    @required this.imageUrl,
  });

  @override
  _SubItemDetailsState createState() => _SubItemDetailsState();
}

class _SubItemDetailsState extends State<SubItemDetails> {
  addFavorite(
    String id,
    String name,
    String description,
    String imageUrl,
    dynamic lon,
    dynamic lat,
    String name1,
    String list,
    BuildContext context,
  ) {
    setState(() {
      DBS.insert(
        'favorites',
        {
          'id': id,
          'name': name,
          'description': description,
          'image_url': imageUrl,
          'lon': lon,
          'lat': lat,
        },
        name1,
        list,
        context,
      );
    });
  }

  addVisited(
    String id,
    String name,
    String description,
    String imageUrl,
    dynamic lon,
    dynamic lat,
    String name1,
    String list,
    BuildContext context,
  ) {
    setState(() {
      DBS.insert(
        'visited',
        {
          'id': id,
          'name': name,
          'description': description,
          'image_url': imageUrl,
          'lon': lon,
          'lat': lat,
        },
        name1,
        list,
        context,
      );
    });
  }

  bool favBool = true;
  bool visBool = true;
  List<Map<String, dynamic>> record = [];

  void ifExistsFav(
    String table,
    String id,
  ) async {
    var exists = await DBS.exists(table, id);
    setState(() {
      record = exists;
      if (record.isEmpty) {
        favBool = false;
      } else {
        favBool = true;
      }
    });
  }

  void ifExistsVis(
    String table,
    String id,
  ) async {
    var exists = await DBS.exists(table, id);
    setState(() {
      record = exists;
      if (record.isEmpty) {
        visBool = false;
      } else {
        visBool = true;
      }
    });
  }

  @override
  void initState() {
    setState(() {
      ifExistsFav(
        'favorites',
        widget.id,
      );
      ifExistsVis(
        'visited',
        widget.id,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.desc),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
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
                        onTap: () => MapsLauncher.launchCoordinates(
                            widget.lon, widget.lat, '${widget.name}'),
                        child: Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                        onTap: () async {
                          var exists = await DBS.exists('favorites', widget.id);
                          setState(() {
                            record = exists;
                            if (record.isEmpty) {
                              addFavorite(
                                widget.id,
                                widget.name,
                                widget.desc,
                                widget.imageUrl,
                                widget.lon,
                                widget.lat,
                                '${widget.name}',
                                'Favorites',
                                context,
                              );
                              favBool = true;
                            } else {
                              DBS.delete(
                                'favorites',
                                widget.id,
                                '${widget.name}',
                                'Favorites',
                                context,
                              );
                              favBool = false;
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Icon(
                          favBool ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
                        onTap: () async {
                          var exists = await DBS.exists('visited', widget.id);
                          setState(() {
                            record = exists;
                            if (record.isEmpty) {
                              addVisited(
                                widget.id,
                                widget.name,
                                widget.desc,
                                widget.imageUrl,
                                widget.lon,
                                widget.lat,
                                '${widget.name}',
                                'Visited',
                                context,
                              );
                              visBool = true;
                            } else {
                              DBS.delete(
                                'visited',
                                widget.id,
                                '${widget.name}',
                                'Visited',
                                context,
                              );
                              visBool = false;
                              Navigator.pop(context);
                            }
                          });
                        },
                        child: Icon(
                          visBool ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
